From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the final tree (tip tree
 related)
Date: Mon, 29 Nov 2010 13:50:45 +1100
Message-ID: <20101129135045.15aec5ed.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__29_Nov_2010_13_50_45_+1100_TLaPrYueM0K+TjqC"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

--Signature=_Mon__29_Nov_2010_13_50_45_+1100_TLaPrYueM0K+TjqC
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the final tree, today's linux-next build (sparc64 defconfig)
failed like this:

arch/sparc/kernel/perf_event.c:1326: error: 'init_hw_perf_event' undeclared=
 here (not in a function)

Caused by commit 004417a6d468e24399e383645c068b498eed84ad ("perf, arch:
Cleanup perf-pmu init vs lockup-detector").

I reverted that commit for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__29_Nov_2010_13_50_45_+1100_TLaPrYueM0K+TjqC
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iQEcBAEBAgAGBQJM8xUFAAoJEDMEi1NhKgbsjIMH/jsbw6VZKB2M5VQcUiuuq5Sp
jp3hsDGrIIDhr2httVu81XoJfJQxFRj/VhIGrCDpiJiSChjQpUYtyz1voG2JmWYO
AVFttHxY4Jnu2jcwgydb+BnpuBKT1xI0/PSGIjG9NQ6kp9/8qiVid6l5khlCbaVQ
j9NF0MZrzEa/9Uk7GS4xipc0GDKGz/koDA3Xt8w4NzsuGdgevk3hNlpRjVPVmiy1
S901mdle0hqn90J0Aomx9BnlG02gAzcakLiNwI34/BUEvcMgWvglBqUGzhZUEjeJ
WX/FEg7hSmyJtXOEZX1sxDDDofZOjkk+eMsL9jB7NV17sr0HoWd2TLsXUED+dns=
=S/30
-----END PGP SIGNATURE-----

--Signature=_Mon__29_Nov_2010_13_50_45_+1100_TLaPrYueM0K+TjqC--
