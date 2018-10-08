From: Mark Brown <broonie@kernel.org>
Subject: Re: next-20181008 build: 2 failures 22 warnings (next-20181008)
Date: Mon, 8 Oct 2018 22:20:21 +0100
Message-ID: <20181008212021.GB4440@sirena.org.uk>
References: <E1g9cV0-0008Sg-4U@optimist>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3605300821608479745=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <E1g9cV0-0008Sg-4U@optimist>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Keith Busch <keith.busch@intel.com>, Bjorn Helgaas <bhelgaas@google.com>, Russell King <linux@armlinux.org.uk>
Cc: linux-pci@vger.kernel.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kernel-build-reports@lists.linaro.org
List-Id: linux-next.vger.kernel.org


--===============3605300821608479745==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lEGEL1/lMxI0MVQ2"
Content-Disposition: inline


--lEGEL1/lMxI0MVQ2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Oct 08, 2018 at 09:51:30PM +0100, Build bot for Mark Brown wrote:

Today's -next fails to build an arm allmodconfig caused by:

> 	arm-allmodconfig
> ../drivers/pci/pcie/aer_inject.c:444:6: error: 'struct pt_regs' has no member named 'ip'

introduced in e3fbcc7c4b130(PCI/AER: Covertly inject errors with ftrace
hooks).  This field is not present on arm.

--lEGEL1/lMxI0MVQ2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlu7yhQACgkQJNaLcl1U
h9BDagf+LwPRL1t1sVSYizjg/QiHkEuWgCoDG/DCISn7+S4tmPq+RUckSydGDWeK
6XORa5lRRTS2XGO8xUbv09CSRpPmWvuUwGJVhXa6aZGpQvpyvM6DK3o05wzcwi32
KigMnayhssOWCdnPzyx8pRZNP76ljay+OPLIvNNgH2Ba3Zlh0kUFjz/9W13gHu9V
BQMi/ZQnGFoad3AM6EISBaDI9gZgvV4HCFOllWK+Jq9uwF7VPKppg0LXSxam9s2D
4Zp78RcALjdzWB7txKoDXJz7f9qRzg0EYDtAnYBzVUL3wPW8eBLcIUhaLOrrvZDq
RpUhMzKmeUhGRDxHCgHqD5MRj/4jjg==
=NAuf
-----END PGP SIGNATURE-----

--lEGEL1/lMxI0MVQ2--


--===============3605300821608479745==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============3605300821608479745==--
