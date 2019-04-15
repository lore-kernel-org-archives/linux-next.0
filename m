From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the net-next tree with the net tree
Date: Mon, 15 Apr 2019 10:54:58 +1000
Message-ID: <20190415105458.63e97507@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/9IVzHh9R+LIuEYUBeldkTc+"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Ursula Braun <ubraun@linux.ibm.com>
List-Id: linux-next.vger.kernel.org

--Sig_/9IVzHh9R+LIuEYUBeldkTc+
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the net-next tree got a conflict in:

  net/smc/af_smc.c

between commit:

  07603b230895 ("net/smc: propagate file from SMC to TCP socket")

from the net tree and commit:

  50717a37db03 ("net/smc: nonblocking connect rework")

from the net-next tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc net/smc/af_smc.c
index 6f869ef49b32,e066899de72d..000000000000
--- a/net/smc/af_smc.c
+++ b/net/smc/af_smc.c
@@@ -457,9 -447,10 +455,10 @@@ static void smc_switch_to_fallback(stru
  /* fall back during connect */
  static int smc_connect_fallback(struct smc_sock *smc, int reason_code)
  {
 -	smc->use_fallback =3D true;
 +	smc_switch_to_fallback(smc);
  	smc->fallback_rsn =3D reason_code;
  	smc_copy_sock_settings_to_clc(smc);
+ 	smc->connect_nonblock =3D 0;
  	if (smc->sk.sk_state =3D=3D SMC_INIT)
  		smc->sk.sk_state =3D SMC_ACTIVE;
  	return 0;
@@@ -783,16 -780,10 +788,14 @@@ static void smc_connect_work(struct wor
  		smc->sk.sk_err =3D -rc;
 =20
  out:
 -	if (smc->sk.sk_err)
 -		smc->sk.sk_state_change(&smc->sk);
 -	else
 -		smc->sk.sk_write_space(&smc->sk);
 +	if (!sock_flag(&smc->sk, SOCK_DEAD)) {
 +		if (smc->sk.sk_err) {
 +			smc->sk.sk_state_change(&smc->sk);
 +		} else { /* allow polling before and after fallback decision */
 +			smc->clcsock->sk->sk_write_space(smc->clcsock->sk);
 +			smc->sk.sk_write_space(&smc->sk);
 +		}
 +	}
- 	kfree(smc->connect_info);
- 	smc->connect_info =3D NULL;
  	release_sock(&smc->sk);
  }
 =20
@@@ -1244,19 -1215,11 +1232,14 @@@ static void smc_listen_work(struct work
  	struct socket *newclcsock =3D new_smc->clcsock;
  	struct smc_clc_msg_accept_confirm cclc;
  	struct smc_clc_msg_proposal *pclc;
- 	struct smc_ib_device *ibdev;
+ 	struct smc_init_info ini =3D {0};
  	bool ism_supported =3D false;
- 	struct smcd_dev *ismdev;
  	u8 buf[SMC_CLC_MAX_LEN];
- 	int local_contact =3D 0;
- 	unsigned short vlan;
- 	int reason_code =3D 0;
  	int rc =3D 0;
- 	u8 ibport;
 =20
 +	if (new_smc->listen_smc->sk.sk_state !=3D SMC_LISTEN)
 +		return smc_listen_out_err(new_smc);
 +
  	if (new_smc->use_fallback) {
  		smc_listen_out_connected(new_smc);
  		return;

--Sig_/9IVzHh9R+LIuEYUBeldkTc+
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlyz1mIACgkQAVBC80lX
0GwZcQf+OTmWmq3W322azok557zqAjW9aiOq74uyx9jXfo31KW8aHV+GWvpPv9rx
hl+v5w9lnh/FxaVi8vH6+h4B+DezAZ3B6X01ieWXLWNxTsTnTUMysMAXPXINHVZ5
xX62gQeU0zhDKOCGePSOdK0SHO5s0umGZFHFGqkBXjYymn6jczhCOPkT1MrNJLro
39rm11aAONKddxwcXBZQuk71COkqZcLirrLK7CQ3m9EMm9ALNpEyRrRykK+f54GR
+uZxdOMzCQlyIzn2PZJr1cZxMpte32GEo9aT0HMRFvTI+jAopALi7zOtvwYrWjhJ
tbgf9meIxJJhWXHYiaoRJCFZClaXZA==
=MwTp
-----END PGP SIGNATURE-----

--Sig_/9IVzHh9R+LIuEYUBeldkTc+--
