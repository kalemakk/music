package com.arnoldkk.music.services;

import org.springframework.stereotype.Service;
import reactor.core.publisher.Flux;

@Service
public class HelloService {

    public Flux<String> getHellos(){
        return Flux.just("Hello", "How are you", "Whats up");
    }
}
