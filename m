From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warnings after merge of the access_once tree
Date: Thu, 26 Mar 2015 19:31:12 +1100
Message-ID: <20150326193112.2c87eb39@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/7YqoqRcLWF_d56hNb_=yVME"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:52836 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751740AbbCZIbV (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 26 Mar 2015 04:31:21 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Christian Borntraeger <borntraeger@de.ibm.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Davidlohr Bueso <dave@stgolabs.net>

--Sig_/7YqoqRcLWF_d56hNb_=yVME
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Christian,

After merging the access_once tree, today's linux-next build (arm
multi_v7_defconfig) produced lots of this warning:

In file included from include/linux/linkage.h:4:0,
                 from include/linux/preempt.h:9,
                 from include/linux/spinlock.h:50,
                 from include/linux/lockref.h:17,
                 from lib/lockref.c:2:
In function '__read_once_size',
    inlined from 'lockref_get' at lib/lockref.c:50:2:
include/linux/compiler.h:216:3: warning: call to 'data_access_exceeds_word_=
size' declared with attribute warning: data access exceeds word size and wo=
n't be atomic
   data_access_exceeds_word_size();
   ^

Introduced by commit 6becd6bd5e89 ("compiler.h: Fix word size check for
READ/WRITE_ONCE") presumably interacting with commit 4d3199e4ca8e
("locking: Remove ACCESS_ONCE() usage") from the tip tree.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/7YqoqRcLWF_d56hNb_=yVME
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVE8PWAAoJEMDTa8Ir7ZwVPcAQAIAedfoHGZ3i0W4VmeUnpcM8
ptGbgpQ5uXdHfMkDphpkfq5I7Nmp6Z6oCqU2NSEQOCP19tVNBwd7X0a7Ym5CYEVp
5cxKp9nrzME+qPNtnBZV+TxEIETUHdXhEvbzmeG8CA4494JzZF4RQttbzkzlUyoo
wIWI5UJkw3vuvjqgW7ETHDBHmOOJ7JnSa5J5qXwyhxqs+rDac7gvtaudbgzQQm0Y
b/SfHw6W1RjjZUNK1k1mLwQFFO+Zm1DrNsWGdd4krdMb5pOqCPl8vJgqBUcFditF
Qnniy1oZ1uR/8juETC8qj95d55UMtbpVExRCtv44ni1zTPv2IuZvtMhb925ztJRE
mByZwiu3+S2GCSVDF+X7mjbicc/GGZ4eDLKNxOqv7hHo8aUMhb9hlF0LS6dUsvue
a3K6eH+wzksl9WjsBj7j0qPb9PV96pgUoVNuFGryASPAmSex71HUPUQIC7PApgfd
b2+TFIdBmu3CtmpyP9vLne6fwwDD7KFwRnnbxFwHkjbigiGIJXf0FnkNL/LxPUKx
f3QAeHl9Uf8mIg4IiKud4uU6Qxk2yWD9YHRlkKrkLUHDlBINIsTxT+GfgmTJsnQ/
wgKR7nOugRtwoRnqdBNzIIGOwAP0sdN0O8rIgFzBWT1N953SWTfQXmTuCyiYDk2y
X5T0N1K6WlhmvejWuXsi
=uocr
-----END PGP SIGNATURE-----

--Sig_/7YqoqRcLWF_d56hNb_=yVME--
