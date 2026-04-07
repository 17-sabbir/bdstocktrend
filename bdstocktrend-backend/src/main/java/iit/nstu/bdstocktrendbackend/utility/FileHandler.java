package iit.nstu.bdstocktrendbackend.utility;

import iit.nstu.bdstocktrendbackend.models.Stock;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.io.InputStream;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Scanner;

public class FileHandler {

    public static boolean checkCSVFormat(MultipartFile file) {
        String contentType = file.getContentType();

        if (contentType.equals("text/csv")) {
            return true;
        } else {
            return false;
        }
    }

    public static List<Stock> convertCSVToList(InputStream inputStream) {
        List<Stock> stocks = new ArrayList<>();

        Scanner scanner = new Scanner(inputStream);

        scanner.nextLine();
        while (scanner.hasNextLine()) {
            String[] data = scanner.nextLine().split(",");
            Stock stock = new Stock();
            stock.setCode(data[0]);
            stock.setDate(LocalDate.parse(data[1], DateTimeFormatter.ofPattern("M/d/yyyy")));
            stock.setOpen(Double.parseDouble(data[2]));
            stock.setHigh(Double.parseDouble(data[3]));
            stock.setLow(Double.parseDouble(data[4]));
            stock.setClose(Double.parseDouble(data[5]));
            stock.setVolume(Double.parseDouble(data[6]));
            stocks.add(stock);
        }

        return stocks;

    }

    public static List<Stock> convertExcelToList(InputStream inputStream) {
        List<Stock> stocks = new ArrayList<>();

        try {
            XSSFWorkbook workbook = new XSSFWorkbook(inputStream);
            XSSFSheet sheet = workbook.getSheet("");

            Iterator<Row> it = sheet.iterator();
            boolean first = true;
            while (it.hasNext()) {
                Row row = it.next();
                if (first) {
                    first = false;
                    continue;
                }

                Stock stock = new Stock();

                Iterator<Cell> cellIterator = row.iterator();
                int cid = 0;
                while (cellIterator.hasNext()) {
                    Cell cell = cellIterator.next();
                    if (cid == 0) {
                        // stock.setDate(cell.getLocalDateTimeCellValue());
                    } else if (cid == 1) {
                        stock.setOpen(cell.getNumericCellValue());
                    } else if (cid == 2) {
                        stock.setHigh(cell.getNumericCellValue());
                    } else if (cid == 3) {
                        stock.setLow(cell.getNumericCellValue());
                    } else if (cid == 4) {
                        stock.setClose(cell.getNumericCellValue());
                    } else if (cid == 5) {
                        stock.setVolume(cell.getNumericCellValue());
                    }
                    cid++;
                }
                stocks.add(stock);
            }

            return stocks;

        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

}
