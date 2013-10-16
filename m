From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH -next] misc: fix various misc/mic/host/ build errors
Date: Wed, 16 Oct 2013 21:47:40 +0100
Message-ID: <20131016204740.GB2443@sirena.org.uk>
References: <1381762088-18880-1-git-send-email-treding@nvidia.com>
 <525C481E.1010908@infradead.org>
 <20131016192648.GA19637@kroah.com>
 <525EEBD4.7070800@infradead.org>
 <20131016194440.GA14416@kroah.com>
 <20131016203024.GA6579@mithrandir>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="sRz9TtPC492wKWn6"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20131016203024.GA6579@mithrandir>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Harshavardhan R Kharche <harshavardhan.r.kharche@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>, Nikhil Rao <nikhil.rao@intel.com>, Sudeep Dutt <sudeep.dutt@intel.com>
List-Id: linux-next.vger.kernel.org


--sRz9TtPC492wKWn6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Oct 16, 2013 at 10:30:25PM +0200, Thierry Reding wrote:
> On Wed, Oct 16, 2013 at 12:44:40PM -0700, Greg Kroah-Hartman wrote:

> > The driver maintainers have nothing to do with this, it's a sysfs change
> > in my driver-core tree that causes this issue.

> Well, we do carry a patch to fix this, but that generally doesn't get
> carried to Linus' tree automatically as far as I know. So I guess it's
> fine for now, but when the merge window opens you'll need to make sure

Yeah.  This one was one of the ones that went AWOL for a few days due to
being in the middle of the trees I'd produced (due to me doing the
merges).

--sRz9TtPC492wKWn6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSXvtpAAoJELSic+t+oim9Z1EP/0ZccVP1A2d3fDx2qvEByOxW
voN7eiMSDnU2O8IMAEXwdZEpvAFNdCLfoTKfYJ8YFElbqelwTbnh+1OVtnfH0QBn
sS81/JLE5w9HQIBvOyzkDSbgPI+JKyGTF+8nZZDLKQvc2I6SPbYXd7JM6Ux7h0OP
dzbSdwsF7EhJwZ5UwaxmQDXA/Hm1xCdvom6M3zE5nEY5b+si3E9SKUflWOeX7BTN
c/puPksJS2GSmPr8TdhmcSVtr51KcDKi8bw6W/0X1KQcRsg4cdlqQkpzd+fY3ylZ
NK44bwRn5SA1LtxES4OWpgSg5wGS790aT/mREqnDEcmpuJbjFTrEMPJDdmwPYAHE
b0GtpSGtm84fz4Or2tuOQAI3p313qKJwmoWXBKZEnTo4rVnl4aZ81dck6PfH1ocN
wWf5YkelgGx761ELkZkl2Iq6Ied16/7NCxfOvRvsQ+sNuIIHAUHCbaTMkmRt0v53
+02gIKX7dhq0ST0GsugCnwVshl6jys/bEvxz0QsB/WABMCCP2TNe0c/Q6A30VZkF
LbSLgGgcvhqALzVR/SxXTBao6idf4M5IsosTyBHXr4zI36t24yeRGA3knG0Is63S
GzXtzQDxbSSKKuFF4ok+dHZYcmVPx9WClKryy+EKnSYYRE2g89lQl7oSn2ZL5nD3
7dkhbx8Nx2ELe/Rwg6uP
=qwVv
-----END PGP SIGNATURE-----

--sRz9TtPC492wKWn6--
