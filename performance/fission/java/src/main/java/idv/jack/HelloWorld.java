package idv.jack;
import org.springframework.http.RequestEntity;
import org.springframework.http.ResponseEntity;

import io.fission.Function;
import io.fission.Context;

public class HelloWorld implements Function {
    @Override
    public ResponseEntity<?> call(RequestEntity req, Context context) {
        /*int total = 0;
        for (int i = 0; i <= 5000; i++) {
            total = 0;
            for (int j = 0; j <= 100000; j++) {
                total = total + j;
            }
        }
        return ResponseEntity.ok("Hello Java, value is" + total);*/
        return ResponseEntity.ok("Hello Java, For the cold start test.");
    }
}
