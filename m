From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the tty tree
Date: Thu, 4 Oct 2018 15:19:08 +1000
Message-ID: <20181004151501.280d8282@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/CPcBv77g2c0ccP.LnFwiQsO"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg KH <greg@kroah.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Steve Sakoman <steve@sakoman.com>, Andreas Steinmetz <ast@domdv.de>, Eric Gallimore <egallimore@ucsd.edu>
List-Id: linux-next.vger.kernel.org

--Sig_/CPcBv77g2c0ccP.LnFwiQsO
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the tty tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

drivers/tty/serial/samsung.c: In function 's3c24xx_serial_rx_enable':
drivers/tty/serial/samsung.c:87:41: error: subscripted value is neither arr=
ay nor pointer nor vector
 #define rx_enabled(port) ((port)->unused[1])
                                         ^
drivers/tty/serial/samsung.c:138:2: note: in expansion of macro 'rx_enabled'
  rx_enabled(port) =3D 1;
  ^~~~~~~~~~
drivers/tty/serial/samsung.c: In function 's3c24xx_serial_rx_disable':
drivers/tty/serial/samsung.c:87:41: error: subscripted value is neither arr=
ay nor pointer nor vector
 #define rx_enabled(port) ((port)->unused[1])
                                         ^
drivers/tty/serial/samsung.c:153:2: note: in expansion of macro 'rx_enabled'
  rx_enabled(port) =3D 0;
  ^~~~~~~~~~
drivers/tty/serial/samsung.c: In function 's3c24xx_serial_stop_tx':
drivers/tty/serial/samsung.c:86:41: error: subscripted value is neither arr=
ay nor pointer nor vector
 #define tx_enabled(port) ((port)->unused[0])
                                         ^
drivers/tty/serial/samsung.c:165:7: note: in expansion of macro 'tx_enabled'
  if (!tx_enabled(port))
       ^~~~~~~~~~
drivers/tty/serial/samsung.c:86:41: error: subscripted value is neither arr=
ay nor pointer nor vector
 #define tx_enabled(port) ((port)->unused[0])
                                         ^
drivers/tty/serial/samsung.c:185:2: note: in expansion of macro 'tx_enabled'
  tx_enabled(port) =3D 0;
  ^~~~~~~~~~
drivers/tty/serial/samsung.c: In function 's3c24xx_serial_start_tx':
drivers/tty/serial/samsung.c:86:41: error: subscripted value is neither arr=
ay nor pointer nor vector
 #define tx_enabled(port) ((port)->unused[0])
                                         ^
drivers/tty/serial/samsung.c:343:7: note: in expansion of macro 'tx_enabled'
  if (!tx_enabled(port)) {
       ^~~~~~~~~~
drivers/tty/serial/samsung.c:86:41: error: subscripted value is neither arr=
ay nor pointer nor vector
 #define tx_enabled(port) ((port)->unused[0])
                                         ^
drivers/tty/serial/samsung.c:347:3: note: in expansion of macro 'tx_enabled'
   tx_enabled(port) =3D 1;
   ^~~~~~~~~~
drivers/tty/serial/samsung.c: In function 's3c24xx_serial_stop_rx':
drivers/tty/serial/samsung.c:87:41: error: subscripted value is neither arr=
ay nor pointer nor vector
 #define rx_enabled(port) ((port)->unused[1])
                                         ^
drivers/tty/serial/samsung.c:392:6: note: in expansion of macro 'rx_enabled'
  if (rx_enabled(port)) {
      ^~~~~~~~~~
drivers/tty/serial/samsung.c:87:41: error: subscripted value is neither arr=
ay nor pointer nor vector
 #define rx_enabled(port) ((port)->unused[1])
                                         ^
drivers/tty/serial/samsung.c:399:3: note: in expansion of macro 'rx_enabled'
   rx_enabled(port) =3D 0;
   ^~~~~~~~~~
drivers/tty/serial/samsung.c: In function 's3c24xx_serial_rx_drain_fifo':
drivers/tty/serial/samsung.c:87:41: error: subscripted value is neither arr=
ay nor pointer nor vector
 #define rx_enabled(port) ((port)->unused[1])
                                         ^
drivers/tty/serial/samsung.c:621:8: note: in expansion of macro 'rx_enabled'
    if (rx_enabled(port)) {
        ^~~~~~~~~~
drivers/tty/serial/samsung.c:87:41: error: subscripted value is neither arr=
ay nor pointer nor vector
 #define rx_enabled(port) ((port)->unused[1])
                                         ^
drivers/tty/serial/samsung.c:623:6: note: in expansion of macro 'rx_enabled'
      rx_enabled(port) =3D 0;
      ^~~~~~~~~~
drivers/tty/serial/samsung.c:87:41: error: subscripted value is neither arr=
ay nor pointer nor vector
 #define rx_enabled(port) ((port)->unused[1])
                                         ^
drivers/tty/serial/samsung.c:631:6: note: in expansion of macro 'rx_enabled'
      rx_enabled(port) =3D 1;
      ^~~~~~~~~~
drivers/tty/serial/samsung.c: In function 's3c24xx_serial_shutdown':
drivers/tty/serial/samsung.c:86:41: error: subscripted value is neither arr=
ay nor pointer nor vector
 #define tx_enabled(port) ((port)->unused[0])
                                         ^
drivers/tty/serial/samsung.c:981:3: note: in expansion of macro 'tx_enabled'
   tx_enabled(port) =3D 0;
   ^~~~~~~~~~
drivers/tty/serial/samsung.c:87:41: error: subscripted value is neither arr=
ay nor pointer nor vector
 #define rx_enabled(port) ((port)->unused[1])
                                         ^
drivers/tty/serial/samsung.c:990:3: note: in expansion of macro 'rx_enabled'
   rx_enabled(port) =3D 0;
   ^~~~~~~~~~
drivers/tty/serial/samsung.c: In function 's3c24xx_serial_startup':
drivers/tty/serial/samsung.c:87:41: error: subscripted value is neither arr=
ay nor pointer nor vector
 #define rx_enabled(port) ((port)->unused[1])
                                         ^
drivers/tty/serial/samsung.c:1015:2: note: in expansion of macro 'rx_enable=
d'
  rx_enabled(port) =3D 1;
  ^~~~~~~~~~
drivers/tty/serial/samsung.c:86:41: error: subscripted value is neither arr=
ay nor pointer nor vector
 #define tx_enabled(port) ((port)->unused[0])
                                         ^
drivers/tty/serial/samsung.c:1029:2: note: in expansion of macro 'tx_enable=
d'
  tx_enabled(port) =3D 1;
  ^~~~~~~~~~
drivers/tty/serial/samsung.c: In function 's3c64xx_serial_startup':
drivers/tty/serial/samsung.c:87:41: error: subscripted value is neither arr=
ay nor pointer nor vector
 #define rx_enabled(port) ((port)->unused[1])
                                         ^
drivers/tty/serial/samsung.c:1080:2: note: in expansion of macro 'rx_enable=
d'
  rx_enabled(port) =3D 1;
  ^~~~~~~~~~
drivers/tty/serial/samsung.c:86:41: error: subscripted value is neither arr=
ay nor pointer nor vector
 #define tx_enabled(port) ((port)->unused[0])
                                         ^
drivers/tty/serial/samsung.c:1082:2: note: in expansion of macro 'tx_enable=
d'
  tx_enabled(port) =3D 0;
  ^~~~~~~~~~
drivers/tty/serial/samsung.c: In function 's3c24xx_serial_resume_noirq':
drivers/tty/serial/samsung.c:86:41: error: subscripted value is neither arr=
ay nor pointer nor vector
 #define tx_enabled(port) ((port)->unused[0])
                                         ^
drivers/tty/serial/samsung.c:1966:8: note: in expansion of macro 'tx_enable=
d'
    if (tx_enabled(port))
        ^~~~~~~~~~
drivers/tty/serial/samsung.c:87:41: error: subscripted value is neither arr=
ay nor pointer nor vector
 #define rx_enabled(port) ((port)->unused[1])
                                         ^
drivers/tty/serial/samsung.c:1968:8: note: in expansion of macro 'rx_enable=
d'
    if (rx_enabled(port))
        ^~~~~~~~~~

Caused by commit

  c550f01c810f ("serial:serial_core: Allow use of CTS for PPS line discipli=
ne")

Looks like a suprise from some "interesting" previous development.

I have used the tty tree from next-20181003 for today.
--=20
Cheers,
Stephen Rothwell

--Sig_/CPcBv77g2c0ccP.LnFwiQsO
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlu1oswACgkQAVBC80lX
0GzIsAf/YANxSqKdX4JozQDID2JC/cQzYBu7YCtNVFA5nK0ZGuUlMNqai0LpWew7
brtp/xBJiEfHsBceWVl2zHQjqOMBRjbr6O1och5DWotwmF8YEmkWh/jEHRsGaJBR
jMJdbgNjGrijlkGn41/dMMoOfcMXdjH4Hl2JYuytKfOTArzLeiz+I9aDqmD4MNn+
2RRosjOtIkVB+F0/kmpvhNyx4Ql7j3T4bl8CnY4TvdjCxV9NU+Zo5Q6lsXi6vR7a
oA8bJZpas0J82lp01cn04kfwcrTkFjFsHe9fReKBdk2eYCoGyQjQw1yA1ks9BXWx
zqhcHKj8Z7w4tZDidER/SIo4GI0v+w==
=8Mqa
-----END PGP SIGNATURE-----

--Sig_/CPcBv77g2c0ccP.LnFwiQsO--
