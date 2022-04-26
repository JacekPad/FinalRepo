package pl.coderslab.verificationToken;

import org.springframework.stereotype.Service;

import java.util.Random;

@Service
public class TokenServiceImpl implements TokenService {
    TokenRepository tokenRepository;

    public TokenServiceImpl(TokenRepository tokenRepository) {
        this.tokenRepository = tokenRepository;
    }

    @Override
    public Token createToken() {
        Token token = new Token();
        Random random = new Random();
        token.setToken(String.valueOf(random.nextInt(99)));
        tokenRepository.save(token);
        return token;
    }
}
