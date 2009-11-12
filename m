From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: sysctl tree build failure
Date: Thu, 12 Nov 2009 21:47:06 +1100
Message-ID: <20091112214706.7c7b3168.sfr@canb.auug.org.au>
References: <20091112184805.1c0720cb.sfr@canb.auug.org.au>
	<m1ljicp3l0.fsf@fess.ebiederm.org>
	<20091112191451.d21250f2.sfr@canb.auug.org.au>
	<m1fx8kp0op.fsf@fess.ebiederm.org>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__12_Nov_2009_21_47_06_+1100_HNc_Ss47S1333=vu"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:33148 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751508AbZKLKrH (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 12 Nov 2009 05:47:07 -0500
In-Reply-To: <m1fx8kp0op.fsf@fess.ebiederm.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Eric W. Biederman" <ebiederm@xmission.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

--Signature=_Thu__12_Nov_2009_21_47_06_+1100_HNc_Ss47S1333=vu
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Eric,

On Thu, 12 Nov 2009 01:11:34 -0800 ebiederm@xmission.com (Eric W. Biederman=
) wrote:
>
> Any clue how all_noconfig happened to have CONFIG_SYSCTL_SYSCALL set?

CONFIG_SYSCTL_SYSCALL defaults to y and only depends on
CONFIG_PROC_SYSCTL which also defaults to y and depends on CONFIG_PROC_FS
which also defaults to y.  All three are only selectable if
CONFIG_EMBEDDED is y (which it obviously isn't).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__12_Nov_2009_21_47_06_+1100_HNc_Ss47S1333=vu
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkr756oACgkQjjKRsyhoI8zZ+gCfWM8lTzl8jUp3F0ITfY7f8kR2
wkwAoLWtpvdJiIq+4Z3E27+36lp1NyPT
=mbEw
-----END PGP SIGNATURE-----

--Signature=_Thu__12_Nov_2009_21_47_06_+1100_HNc_Ss47S1333=vu--
