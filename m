From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the percpu tree with the s390 tree
Date: Tue, 7 Oct 2014 16:37:42 +1100
Message-ID: <20141007163742.2ab51fd7@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/1HHB5T1456N359mkuNFuEWP"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:43508 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753740AbaJGFhv (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 7 Oct 2014 01:37:51 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Tejun Heo <tj@kernel.org>, Rusty Russell <rusty@rustcorp.com.au>, Christoph Lameter <cl@linux-foundation.org>, Ingo Molnar <mingo@elte.hu>, Martin Schwidefsky <schwidefsky@de.ibm.com>, Heiko Carstens <heiko.carstens@de.ibm.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

--Sig_/1HHB5T1456N359mkuNFuEWP
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the percpu tree got a conflict in
arch/s390/kernel/processor.c between commit dfcc8c377711 ("s390/vtime:
do not reset idle data on CPU hotplug") from the s390 tree and commit
eb7e7d766326 ("s390: Replace __get_cpu_var uses") from the percpu tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc arch/s390/kernel/processor.c
index edefead3b43a,f0305b1189aa..000000000000
--- a/arch/s390/kernel/processor.c
+++ b/arch/s390/kernel/processor.c
@@@ -23,7 -23,8 +23,7 @@@ static DEFINE_PER_CPU(struct cpuid, cpu
   */
  void cpu_init(void)
  {
- 	struct cpuid *id =3D &__get_cpu_var(cpu_id);
 -	struct s390_idle_data *idle =3D this_cpu_ptr(&s390_idle);
+ 	struct cpuid *id =3D this_cpu_ptr(&cpu_id);
 =20
  	get_cpu_id(id);
  	atomic_inc(&init_mm.mm_count);

--Sig_/1HHB5T1456N359mkuNFuEWP
Content-Type: application/pgp-signature; name=signature.asc
Content-Disposition: attachment; filename=signature.asc

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJUM3wrAAoJEMDTa8Ir7ZwVqF0P/3ZbkTGdmr1UQkn56gyyLQEC
n66IsDyEyq9OZDgb0PG+63qZHeJXD0713uXjDjdrnXJSkv/PJiT+VTEp7JzmRlcL
YHvHewxDwKKbKjy/D2XoQy75Bed9t1bRG80TvXPcU0UZKlCJtKSDcMSjQ6uL52FK
R9WvPqlPzhSx1Ce/Wq77JhNSL0pIjXYd7gURC/heNFy/xgIY4jiPsBSsyG6jv5Sq
f+uyrLGojmI/FzF8C9bOhalAf94y4kf0z8yl3sUQrhHSLH0BAeUvEhnk6DesdPc0
Mq3a27qMNyRrWXX/OIstPRtKgyPtU/WjH9RGhIEDhUejk5KQ9RMTmA4hvH38Efcz
FlbIPQkrWUQSRd4sLgWbN7Y+xBIZPnfW5TO9Y6Xg0CUONOk69XhWHV1o+WlYfKFj
0uNcQZHN/Vdq4RpGVRu9vvloXxzrIHlKZzJYWSIGZwyDPD00jJ5mjYQ/2HbPCbJn
CLbL67FBZHPafxF/JwPS5Tnmem97Z5H1d29gehtqUZIwKX4jXFrDTP8Z5U8Xg2L3
SfFyFaPwR98awhCT5XEtBTfbcko64q/HEpEOPO2Lz4jnhevKzel66D6jzzlqUzPm
UJnhrxEv2HKNcLNVFP6ym9lxO0pjd2BmjC6sXiptqyere5a2uQyM0r7gH+YJIr54
bd49s6Vh/x8NlSkOUQFB
=gzom
-----END PGP SIGNATURE-----

--Sig_/1HHB5T1456N359mkuNFuEWP--
