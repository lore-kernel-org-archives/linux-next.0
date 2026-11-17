Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794955473;
	b=gG6o6N3hWdNObyPl84yMp37eNkh1jI7AaeHHOF6Gv7qA8ucKFPQwWce0Bfk/y8E9aFap
	 isZPwUach8QTtUAKARMtyVfHlxcK9aZ822yetNA4WtJpfRlsro3+EG5Hw4AaN04UAeC3G
	 VY3ugOuotpRk0dmGBi8rT2a2CSXch0NPs4KajFe0KAtiU32qcFQmOcbUxxTW5muowfKdR
	 xff1rZSmUJcavYqExCppl8XvwWyGcvv0mN7G4kp0Z19DqxA7m1DLRY25wI0enKGo76WFs
	 ZNOcp1i4Rzdb6xlrqXmIFUah42rUdxr3SSfw5eDc2fVfb4IjmlX+4Pxk1HajfJPW3lA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794955473;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=KPn6RbDbf0BjcbjfkEST8d4VOms5lu6bkJ4JXi5PvL8=;
	b=iq+FSvw8AmgW8BwBH1R9ZtDVeM+wgjEOvweNjdbTX8v7nUoTkV4g6FT1tYUID5qMmQ5j
	 tj+WOsAzSr4oplrfijnOKjkzx2dxy4KqeWBNUE2S3g1glTKFRc6j5nRCi/WXlu6B+6bFj
	 bC/9nUemS86rq2wv6aE14K6zuq92R6LT0QxzvY0ci3CHTDrcjGnGEiw8DKZsyOvRX1X+i
	 IBOFHD4hFWZlTs5BCp/jZzQsjQRf2slD8MQcLxlF9wNRudHR4ZmG2v7JwIKze/XMzeKYz
	 f/57eVdMYo2e1zlJNqNRu31RLsDExD8otiLK+b8P/4GXagRTzqdRi4eJ0OCsii9EqfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LJUFJ9Dr;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1113606A31C;
	Tue, 17 Nov 2026 22:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LJUFJ9Dr
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75B1D1F000C4;
	Tue, 17 Nov 2026 22:44:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794955473;
	bh=KPn6RbDbf0BjcbjfkEST8d4VOms5lu6bkJ4JXi5PvL8=;
	h=Date:From:To:Cc:Subject;
	b=LJUFJ9Drq/in6fCvVIjPLcpJZVrhX7ESoBj1uEM86Iw5gJtURgXivwXjyyi8gDds/
	 EBRIgkvnziBXbwaxet+/ZBe29ENav4zvFb0WLJiKjzufcYZRAUBfbmBrAcxn9x3oZQ
	 kbYwDjKU9wnZjEJU+bqK4GjFxJWB/UOvCG73QBuT4vhrVvntyesKCyRENNWgMomB7S
	 3Djxe6Wqj/HYWBeUyocbU5VOUCz5/189ExuUNbjWx1LdJZO8oNTtYxmbR+wr2LMNZp
	 hCz2oQc8uwaJNvgQnDikvGxntCHYkXuWzuJTLMoH29qO6MezkKQQSP1LVWaR1sq8Xj
	 R51yAFSZhGmqw==
Date: Tue, 17 Nov 2026 22:44:28 +0000
From: Mark Brown <broonie@kernel.org>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: Boqun Feng <boqun.feng@gmail.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Joel Fernandes <jfern@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
	Uladzislau Rezki <urezki@gmail.com>
Subject: linux-next: manual merge of the paulmck tree with the rcu tree
Message-ID: <avzYzJYQGafi4gGL@sirena.org.uk>
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Post: <mailto:linux-next@vger.kernel.org>
List-Help: <mailto:linux-next+help@vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-next+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="c04WuSgqULRMduVx"
Content-Disposition: inline


--c04WuSgqULRMduVx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the paulmck tree got a conflict in:

  tools/testing/selftests/rcutorture/bin/torture.sh

between commit:

  7ada0a57267ab ("torture: Use ${:+} to save a few lines in torture.sh's to=
rture_one()")

=66rom the rcu tree and commit:

  436f3c6b27de8 ("torture.sh: Add hazptr torturing")

=66rom the paulmck tree.  AFAICT the change in the hazptr commit is adding
quoting that is also covered by the other commit and should have been
redundant anyway but you really want to double check here.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --combined tools/testing/selftests/rcutorture/bin/torture.sh
index 1b7ad2c15e1ed,90b5e113a0b03..0000000000000
--- a/tools/testing/selftests/rcutorture/bin/torture.sh
+++ b/tools/testing/selftests/rcutorture/bin/torture.sh
@@@ -43,10 -43,11 +43,11 @@@ f
  configs_rcutorture=3D
  configs_locktorture=3D
  configs_scftorture=3D
+ configs_hazptr=3D
  kcsan_kmake_args=3D
 =20
  # Default compression, duration, and apportionment.
 -compress_concurrency=3D"`identify_qemu_vcpus`"
 +compress_concurrency=3D"${TORTURE_ALLOTED_CPUS}"
  duration_base=3D10
  duration_rcutorture_frac=3D7
  duration_locktorture_frac=3D1
@@@ -70,6 -71,7 +71,7 @@@ do_rcutasksflavors=3D"${ifnotaarch64}" #=20
  do_srcu_lockdep=3Dyes
  do_atomic_srcu=3Dyes
  do_rcu_rust=3Dno
+ do_hazptr=3Dyes
 =20
  # doyesno - Helper function for yes/no arguments
  function doyesno () {
@@@ -90,6 -92,7 +92,7 @@@ usage ()=20
  	echo "       --do-all"
  	echo "       --do-allmodconfig / --do-no-allmodconfig / --no-allmodconfi=
g"
  	echo "       --do-clocksourcewd / --do-no-clocksourcewd / --no-clocksour=
cewd"
+ 	echo "       --do-hazptr / --do-no-hazptr / --no-hazptr"
  	echo "       --do-kasan / --do-no-kasan / --no-kasan"
  	echo "       --do-kcsan / --do-no-kcsan / --no-kcsan"
  	echo "       --do-kvfree / --do-no-kvfree / --no-kvfree"
@@@ -119,6 -122,11 +122,11 @@@ d
  		compress_concurrency=3D$2
  		shift
  		;;
+ 	--config-hazptr|--configs-hazptr)
+ 		checkarg --configs-hazptr "(list of config files)" "$#" "$2" '^[^/]\+$'=
 '^--'
+ 		configs_hazptr=3D"$configs_hazptr $2"
+ 		shift
+ 		;;
  	--config-rcutorture|--configs-rcutorture)
  		checkarg --configs-rcutorture "(list of config files)" "$#" "$2" '^[^/]=
\+$' '^--'
  		configs_rcutorture=3D"$configs_rcutorture $2"
@@@ -149,6 -157,7 +157,7 @@@
  		do_kasan=3Dyes
  		do_kcsan=3Dyes
  		do_clocksourcewd=3D"${ifnotaarch64}"
+ 		do_hazptr=3Dyes
  		do_srcu_lockdep=3Dyes
  		do_atomic_srcu=3Dyes
  		;;
@@@ -158,6 -167,9 +167,9 @@@
  	--do-clocksourcewd|--do-no-clocksourcewd|--no-clocksourcewd)
  		do_clocksourcewd=3D`doyesno "$1" --do-clocksourcewd`
  		;;
+ 	--do-hazptr|--do-no-hazptr|--no-hazptr)
+ 		do_hazptr=3D`doyesno "$1" --do-hazptr`
+ 		;;
  	--do-kasan|--do-no-kasan|--no-kasan)
  		do_kasan=3D`doyesno "$1" --do-kasan`
  		;;
@@@ -185,6 -197,7 +197,7 @@@
  		do_kasan=3Dno
  		do_kcsan=3Dno
  		do_clocksourcewd=3Dno
+ 		do_hazptr=3Dno
  		do_srcu_lockdep=3Dno
  		do_atomic_srcu=3Dno
  		;;
@@@ -341,8 -354,16 +354,8 @@@ touch $T/successe
  # Note that quoting is problematic.  So on the command line, pass multiple
  # values with multiple kvm.sh argument instances.
  function torture_one {
 -	local cur_bootargs=3D
 -	local boottag=3D
 -
  	echo " --- $curflavor:" Start `date` | tee -a $T/log
 -	if test -n "$torture_bootargs"
 -	then
 -		boottag=3D"--bootargs"
 -		cur_bootargs=3D"$torture_bootargs"
 -	fi
 -	"$@" "${boottag}" "$cur_bootargs" --datestamp "$ds/results-$curflavor" >=
 $T/$curflavor.out 2>&1
 +	"$@" ${torture_bootargs:+--bootargs "$torture_bootargs"} --datestamp "$d=
s/results-$curflavor" > $T/$curflavor.out 2>&1
  	retcode=3D$?
  	resdir=3D"`grep '^Results directory: ' $T/$curflavor.out | tail -1 | sed=
 -e 's/^Results directory: //'`"
  	if test -z "$resdir"
@@@ -720,6 -741,17 +733,17 @@@ the
  	fi
  fi
 =20
+ # Calculate hazptr defaults and apportion time
+ if test -z "$configs_hazptr"
+ then
+ 	configs_hazptr=3DCFLIST
+ fi
+ if test "$do_hazptr" =3D "yes"
+ then
+ 	torture_bootargs=3D""
+ 	torture_set "hazptr" tools/testing/selftests/rcutorture/bin/kvm.sh --tor=
ture hazptr --allcpus --duration "$duration_rcutorture" --configs "$configs=
_hazptr" --trust-make
+ fi
+=20
  echo " --- " $scriptname $args
  echo " --- " Done `date` | tee -a $T/log
  ret=3D0

--c04WuSgqULRMduVx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmr82MsACgkQJNaLcl1U
h9Ckagf/buYeQjYmSE6CRQ2+gpbYKJKv1+Igp5TCuKI7i0EA6ar8vokZjm00C15B
LgFVFX6McaUqxXnsRXLNe1GMBswjVup1OutmD+n2TWskKbtvtz5avaiZlIT+AmuG
vTclDe0QtRV6bEREYBcIqGrxE8rsaPBQGhoC29ePTuS7UovdTk8/9qHELkXG0KsT
7gyhdMd5Hg0nkppbdy+sFMgNU+VtaBdvqOAqTeZLB4MEo38NlFb06SwfnA09mCQd
Lop7ptSXNiGd79UPezuZ9zXbbvXB513rWwr+tagyTEySyVZbminFrYhQSKHDpYe3
u9ZBf9M+UyuCuVf+jPngmLd5yQKNhQ==
=M4Kr
-----END PGP SIGNATURE-----

--c04WuSgqULRMduVx--
