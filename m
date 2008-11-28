From: Nico -telmich- Schottelius
	<nico-linux-ipw3945-devel@schottelius.org>
Subject: Re: [ipw3945-devel] next-20081125: call trace for iwlagn (rfkill
	switch on)
Date: Fri, 28 Nov 2008 08:53:08 +0100
Message-ID: <20081128075308.GE5413@denkbrett.schottelius.org>
References: <20081128063859.GB4700@denkbrett.schottelius.org> <AFAB8585072C7E48BC5C6F9C87F9B7970214D75A@pdsmsx502.ccr.corp.intel.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ytoMbUMiTKPMT3hY"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx3.schottelius.org ([77.109.138.221]:50063 "EHLO
	mx3.schottelius.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750842AbYK1HxL (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 28 Nov 2008 02:53:11 -0500
Content-Disposition: inline
In-Reply-To: <AFAB8585072C7E48BC5C6F9C87F9B7970214D75A@pdsmsx502.ccr.corp.intel.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Luo, Ximin" <ximin.luo@intel.com>
Cc: "ipw3945-devel@lists.sourceforge.net" <ipw3945-devel@lists.sourceforge.net>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>


--ytoMbUMiTKPMT3hY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Luo, Ximin [Fri, Nov 28, 2008 at 03:03:23PM +0800]:
> Maybe you can the download the latest driver which had fixed this issue.
> You can get the information from http://www.intellinuxwireless.org/bugzilla/show_bug.cgi?id=1800

You are not (yet?) preparing a git repo for inclusion into linux-next, do you?

I just found http://www.intellinuxwireless.org/repos/mac80211.git and
http://www.intellinuxwireless.org/repos/iwlwifi.git

Do I (still) need both repos? Is running "make patch_kernel" for mac802.11
still up-to-date for patching linux-next based?

Sincerly,

Nico

--ytoMbUMiTKPMT3hY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkkvo2QACgkQuL75KpiFGIzdEgCfXf6mhjdn+MR11ewtrmGfLk7b
9owAoI3IQQIM5L0I/hqlp5A4Hv8z15u+
=3knI
-----END PGP SIGNATURE-----

--ytoMbUMiTKPMT3hY--
