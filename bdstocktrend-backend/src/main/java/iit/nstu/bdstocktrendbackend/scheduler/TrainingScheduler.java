package iit.nstu.bdstocktrendbackend.scheduler;

import iit.nstu.bdstocktrendbackend.service.remote.RemoteService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import java.time.LocalDateTime;

@RequiredArgsConstructor
@Component
@Slf4j
public class TrainingScheduler {

    private final RemoteService remoteService;

    //@Scheduled(cron = "0 0 15 * * *", zone = "Asia/Dhaka") //everyday at 3.00 PM
    @Scheduled(cron = "0 12 01 * * *", zone = "Asia/Dhaka") //260 Asia/Dhaka
    public void initTraining(){
        log.info("Training initiated at: "+ LocalDateTime.now());

        remoteService.syncAndTraining();

        log.info("Training completed at: "+ LocalDateTime.now());
    }
}
