From: Mark Brown <broonie@kernel.org>
Subject: Re: next-20181008 build: 2 failures 22 warnings (next-20181008)
Date: Mon, 8 Oct 2018 23:35:55 +0100
Message-ID: <20181008223555.GC4440@sirena.org.uk>
References: <E1g9cV0-0008Sg-4U@optimist> <20181008212021.GB4440@sirena.org.uk>
 <20181008213006.GP120535@bhelgaas-glaptop.roam.corp.google.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5011841797251374886=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20181008213006.GP120535@bhelgaas-glaptop.roam.corp.google.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: linaro-kernel@lists.linaro.org, kernel-build-reports@lists.linaro.org, linux-pci@vger.kernel.org, Russell King <linux@armlinux.org.uk>, Keith Busch <keith.busch@intel.com>, linux-next@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-next.vger.kernel.org


--===============5011841797251374886==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9Ek0hoCL9XbhcSqy"
Content-Disposition: inline


--9Ek0hoCL9XbhcSqy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Oct 08, 2018 at 04:30:06PM -0500, Bjorn Helgaas wrote:
> On Mon, Oct 08, 2018 at 10:20:21PM +0100, Mark Brown wrote:

> > introduced in e3fbcc7c4b130(PCI/AER: Covertly inject errors with ftrace
> > hooks).  This field is not present on arm.

> I dropped e3fbcc7c4b130 and related patches already, so this should be gone
> in my current "next" branch (18b4baa4d9fc).

Great, thanks!

--9Ek0hoCL9XbhcSqy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlu728oACgkQJNaLcl1U
h9AZKgf/XrttVoBik3Ae3xV3ITN2e/UhUOlxb95c666bag+2PI4WGvOF+roDvFUh
pa9yUWVjqaymcEp8dMuHcfea2miQWzbuQhfnijfRjzWA8DCvz5R2W5TJBPAuSk22
KzcF9sp+1tonxJK8M9mwz4I5/Gd5QPvH5txYvNGRdwLZClrayyhLfpyAhf4l1ZfO
Z/hM7BNR86IOOCQsjbhM3Kn+du4fsg6tigszMep0CuYzERBQaia5Syg+spYfDw1u
95ESxmwkA4OFBi9TU/DajKPqVlTLf+vmrHv+cNpXaQyTIc/slVpncy4Dr+j0AFWn
BaNGTV6sESBZjBaFsovP9IYqiPKt0Q==
=pUMI
-----END PGP SIGNATURE-----

--9Ek0hoCL9XbhcSqy--


--===============5011841797251374886==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============5011841797251374886==--
