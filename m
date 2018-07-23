From: Mark Brown <broonie@kernel.org>
Subject: Re: next-20180723 build: 2 failures 11 warnings (next-20180723)
Date: Mon, 23 Jul 2018 19:25:03 +0100
Message-ID: <20180723182503.GH13981@sirena.org.uk>
References: <E1fheAy-0003tU-Dq@optimist>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5945030942620407874=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <E1fheAy-0003tU-Dq@optimist>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Andrew Morton <akpm@linux-foundation.org>, David Rientjes <rientjes@google.com>, Russell King <linux@armlinux.org.uk>
Cc: linaro-kernel@lists.linaro.org, kernel-build-reports@lists.linaro.org, Davidlohr Bueso <dave@stgolabs.net>, linux-next@vger.kernel.org, linux-mm@vger.kernel.org, Alexey Dobriyan <adobriyan@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-next.vger.kernel.org


--===============5945030942620407874==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="XRI2XbIfl/05pQwm"
Content-Disposition: inline


--XRI2XbIfl/05pQwm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 23, 2018 at 05:59:12PM +0100, Build bot for Mark Brown wrote:

Today's -next fails to build an arm allnoconfig (and a bunch of other
arm configs from the look of some of the other builder reports) with:

> 	arm-allnoconfig
> ../mm/vmacache.c:14:39: error: 'PMD_SHIFT' undeclared (first use in this function)
> ../mm/vmacache.c:14:39: error: 'PMD_SHIFT' undeclared (first use in this function)
> ../mm/vmacache.c:127:26: error: 'addr' undeclared (first use in this function)
> ../mm/vmacache.c:14:39: error: 'PMD_SHIFT' undeclared (first use in this function)

due to 5d2f33872046e (mm, vmacache: hash addresses based on pmd) which
uses PMD_SHIFT rather than PAGE_SHIFT for VMACACHE_HASH() but that's not
defined in at least !MMU arm configs.  There is a reference to it in
arm/pgtable-nommu.h but only in comments with FIXMEs next to them.

--XRI2XbIfl/05pQwm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAltWHX8ACgkQJNaLcl1U
h9CV1wf8Drr0zu5PAlo075hV5OM4Ayd1BKHlEe7yxOqzkr4mcfNvpPix4wwTf+YN
ENemtEyJCHHeX8rozTn9DhDhwZDEjBwnt38RpAmpFiLntLC9oBpG0vUinFLKwIwd
GLU6CA0B2hd2uxxZSmmmJI7VvfNufidj4BOam5N7uYc9IMFWRz2ifCAyTMH81aIV
W08RMQ7zoR4b2ifFVxRJ4gIjIwdI8I9HM5NoXqXtyVNC1J1hD8ccIOWRq3ck80pb
di7Qwl9F+OYrE4uAdprfPCPqtbiV8MGDv4cRt+omPLXreuUaXmRO5vv0h4MEV8f+
/cB6mo6seGoz4Qy/weMH7UObOepPYA==
=/Uou
-----END PGP SIGNATURE-----

--XRI2XbIfl/05pQwm--


--===============5945030942620407874==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============5945030942620407874==--
