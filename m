From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the tip tree with Linus' tree
Date: Wed, 19 Aug 2009 16:07:58 +1000
Message-ID: <20090819160758.f23f2e8a.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__19_Aug_2009_16_07_58_+1000_/0rZynifDzzLkPXM"
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1751154AbZHSGIJ@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

--Signature=_Wed__19_Aug_2009_16_07_58_+1000_/0rZynifDzzLkPXM
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the tip tree got a conflict in
kernel/irq/manage.c between commit
69ab849439b506cd8dd2879527fdb64d95dd5211 ("genirq: Wake up irq thread
after action has been installed") from Linus' tree and commit
3c26caa7409ad5367b257de3d7943551d4a959ee ("genirq: Do not wakeup irq
thread from __setup_irq() and set action->irq") from the tip tree.

I used the version from Linus' tree (as seems to have been done in
tip:master).
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__19_Aug_2009_16_07_58_+1000_/0rZynifDzzLkPXM
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkqLlr4ACgkQjjKRsyhoI8wWWgCfV+z70IlO0JkIwx5Ol6rXsPxc
vmgAn0DpQ6+eNtZq/pIOfzC2+vtvF6hW
=PEyf
-----END PGP SIGNATURE-----

--Signature=_Wed__19_Aug_2009_16_07_58_+1000_/0rZynifDzzLkPXM--
