From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the xen-two tree
Date: Sat, 16 Feb 2013 00:50:14 +1100
Message-ID: <20130216005014.c8ce70e041f655d4c195c9fb@canb.auug.org.au>
References: <20130215154551.d11e9d376d30d32b9673e6cc@canb.auug.org.au>
	<20130215132624.GB11777@phenom.dumpdata.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Sat__16_Feb_2013_00_50_14_+1100_NxnTy3ajNgmNyQ=c"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20130215132624.GB11777@phenom.dumpdata.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Liu Jinsong <jinsong.liu@intel.com>, "Rafael J. Wysocki" <rjw@sisk.pl>
List-Id: linux-next.vger.kernel.org

--Signature=_Sat__16_Feb_2013_00_50_14_+1100_NxnTy3ajNgmNyQ=c
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Konrad,

On Fri, 15 Feb 2013 08:26:24 -0500 Konrad Rzeszutek Wilk <konrad.wilk@oracl=
e.com> wrote:
>
> Thank you. I keep on forgetting - but would it be OK for me to take this
> patch in my tree? Or should I not since this is a new functionality that
> Rafael is going to introduce in v3.9?

It is an API change in the pm tree that is not yet in Linus' tree.

> And if so, perhaps I should tack it on in my tree, once Rafael does a git
> pull to Linus? Or just point Linus to this git commit?

You should point Linus at this patch if the pm tree is merged first, or
Rafael should do the same if the reverse happens.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Signature=_Sat__16_Feb_2013_00_50_14_+1100_NxnTy3ajNgmNyQ=c
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBCAAGBQJRHj0WAAoJEECxmPOUX5FEwtwP/jkXYyLbD7gu6iHuY2L3yaw0
/mr/zzibC5epau7Mp/AYn8mbUU5twCQIGY7tRSkmul5DY5zwQxk9jRxwRLRZPfKc
Pg2pG1vH37ynFjsgV2T2a8amGyO/vCFpNsGTljPABZwB17ftZLVTEm3dAMRfGNMX
OvL+V4yMShkWhGxopfcylv/y3b18A0xLRWWUdAA0vtUGtm8aAsNaqE+xi/ZPpG/T
hDp4k1m3C/dGNRVj4OTprpY9gKvWSI7QBXYmqTj+CB88gz7Njy3iNpqjaDILFjOQ
zUKhZz5TmjOWzutbp2p9uYhqf9ysHB5cTIUPAOOqthN2/aTpfO0js2zw5Yg2higr
l/V65h/T2UV0uXbVH06GLowqdztWO1XMXtuBa3/6768uVF+tLxtZRCw6PODhm5tC
7sz3YLe78bkrpx7YFBesiCzZexiyzZ5CYZ2Yt0U51POP/WAzEMpE+wIKUYviYHHf
sN2V/IkkS2223LrW2yQKAdZTqTFq3xnLLVMQ4wta+aJQILM0lQg1r2tk8LACiqb8
NJJRoGcrT7TnGtJCGfHhFztqGH7aP7lOPOQraORMX6FIGSZa+5rlMF/2Wxhy/4k/
oWgqBxxzKLTj/VZTlTSkfJ5a8WEojq670kC0cHM6LxKHVzjsfcYxlXTZzmO9xyIW
GtsppRL7eQQWqoyAe+I6
=COZ4
-----END PGP SIGNATURE-----

--Signature=_Sat__16_Feb_2013_00_50_14_+1100_NxnTy3ajNgmNyQ=c--
