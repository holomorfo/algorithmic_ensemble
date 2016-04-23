// Partition of a number
// Arthur Carabott
// "http://new-supercollider-mailing-lists-forums-use-these.2681727.n2.nabble.com/non-random-integer-partition-td7622273.html
//http://new-supercollider-mailing-lists-forums-use-these.2681727.n2.nabble.com/non-random-integer-partition-td7622273.html"
(
// SuperCollider
~partition ={|n=8|
    var x, m, h, r, t, ret;
    x=Array.fill(n, 1);
    x[0]=n;
    m=0;
    h=0;
    ret = List[n];

    while({x[0] != 1}, {
        if(x[h] == 2) {
            m = m+1;
            x[h] = 1;
            h = h-1;
        } {
            r = x[h]-1;
            t=(m-h+1);
            x[h] = r;

            while({t>=r},{
                h=h+1;
                x[h]=r;
                t= t-r;
            });

            if(t==0) {
                m=h
            } {
                m=(h+1);
                if(t>1) {
                    h=(h+1);
                    x[h] = t;
                };
            };
        };

        ret.add(x[0..m]);
    });
    ret;
};
);