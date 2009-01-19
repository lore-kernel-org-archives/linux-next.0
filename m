From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the cpus4096 tree
Date: Mon, 19 Jan 2009 12:08:12 +1100
Message-ID: <20090119120812.2625740e.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__19_Jan_2009_12_08_12_+1100_6=sisMb0crG8_7g/"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:56660 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755406AbZASBIV (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 18 Jan 2009 20:08:21 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>
Cc: linux-next@vger.kernel.org

--Signature=_Mon__19_Jan_2009_12_08_12_+1100_6=sisMb0crG8_7g/
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the cpus4096 tree got a conflict in
arch/x86/kernel/cpu/cpufreq/acpi-cpufreq.c between commit
4a922a969cb0190ce4580d4b064e2ac35f3ac9bf ("x86, cpufreq: remove leftover
copymask_copy()") from the x86 tree and commit
5cd7376200be7b8bab085557ff5876b04bd84191 ("fix: crash: IP:
__bitmap_intersects+0x48/0x73") from the cpus4096 tree.

They both remove the same line in get_cur_val, but the latter adds
another line.  I have used the new line from the latter.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__19_Jan_2009_12_08_12_+1100_6=sisMb0crG8_7g/
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAklz0nwACgkQjjKRsyhoI8yIbQCeIEI4MFuw9xeKfYdKMcoriD2W
TX0An0B2PHxGuE7SrINADIutzgmv5FnB
=emQw
-----END PGP SIGNATURE-----

--Signature=_Mon__19_Jan_2009_12_08_12_+1100_6=sisMb0crG8_7g/--
