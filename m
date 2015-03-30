From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the idle tree
Date: Mon, 30 Mar 2015 12:43:53 +1100
Message-ID: <20150330124353.62c1329e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/PvBv+WKR11HYDvKYUiBzgvi"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:35802 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752349AbbC3BoA (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 29 Mar 2015 21:44:00 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Len Brown <lenb@kernel.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

--Sig_/PvBv+WKR11HYDvKYUiBzgvi
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Len,

After merging the idle tree, today's linux-next build (x86_64
allmodconfig) failed like this:

In file included from arch/x86/include/asm/msr.h:131:0,
                 from arch/x86/include/asm/processor.h:20,
                 from arch/x86/include/asm/thread_info.h:23,
                 from include/linux/thread_info.h:54,
                 from arch/x86/include/asm/preempt.h:6,
                 from include/linux/preempt.h:18,
                 from include/linux/smp.h:55,
                 from include/linux/kernel_stat.h:4,
                 from drivers/cpufreq/intel_pstate.c:14:
drivers/cpufreq/intel_pstate.c: In function 'core_get_turbo_pstate':
drivers/cpufreq/intel_pstate.c:593:9: error: 'MSR_NHM_TURBO_RATIO_LIMIT' un=
declared (first use in this function)
  rdmsrl(MSR_NHM_TURBO_RATIO_LIMIT, value);
         ^
arch/x86/include/asm/paravirt.h:153:26: note: in definition of macro 'rdmsr=
l'
  val =3D paravirt_read_msr(msr, &_err); \
                          ^
drivers/cpufreq/intel_pstate.c:593:9: note: each undeclared identifier is r=
eported only once for each function it appears in
  rdmsrl(MSR_NHM_TURBO_RATIO_LIMIT, value);
         ^
arch/x86/include/asm/paravirt.h:153:26: note: in definition of macro 'rdmsr=
l'
  val =3D paravirt_read_msr(msr, &_err); \
                          ^

Caused by commit ce62fbaf893c ("tools/power turbostat: define and dump
MSR_TURBO_RATIO_LIMIT2").  Grep is your friend ...

I have used the idle tree from next-20150327 for today.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/PvBv+WKR11HYDvKYUiBzgvi
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVGKpdAAoJEMDTa8Ir7ZwVpi8QAJRDwXqi0AIpJ0oBt2lTUw/H
KaNstF1iEkI6sJ1SZr7PI9HvO+EPQwdAnabccFmIKEDlrvObUVJH6nPsdoN53syo
H129bPn1khRhR02ILgGJ4Ut69P2Bp7LJUJ5PDdwYYFwLZh6A3yXEigEJuGa+6R3d
eEeEMGzwnq9JaVhmpn2oIIFEubXZvzvhV+15p0A4QYBsc6BTuLn+8carc+AcnAdR
wr5yQynhnWAT6g8ln+D+uL2zOcfrkUrX/R+afeiMbCaRidu6VSI+xeQyUSiB1wnr
UXgpobTz7iDV+E0xct5pVHp2qmrCpAXyuWLtk9qxqh+SOSTVgOCh/RYTTZt4N2gP
9nnifuWxcbTNhr13huIVEaA0YqJtU69tTd/woNjOZJbZZJCIYyF8qdzpzCkLTS2l
GKTTvL6VNcAE481HjEvB6nxcb5hUMjAeybi+VjIDkKcSrNmHQuVLZlMNknMjiqfQ
uf8dT63g+IL5DNCuRvjPa/kpX6B+XPN0J4NnegW3oIsRvbN3ARN6/GjGFNkJc+8u
c9mSX6/2na2Mp4sddtl2bED/cZd/e75QBl0f5uDGA6oKKcjGvKrOxRnLkWjfGlAv
CranZKEhO79Tgz7ad6mTIhBF4JtG/fxyopEP4wgubzoVNcLcbN9zeBWa0JkxoNsY
g/V8ldhCimnw5OFvS6FN
=Xtzt
-----END PGP SIGNATURE-----

--Sig_/PvBv+WKR11HYDvKYUiBzgvi--
