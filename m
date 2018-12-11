From: Mark Brown <broonie@kernel.org>
Subject: Re: next-20181211 build: 1 failures 32 warnings (next-20181211)
Date: Tue, 11 Dec 2018 22:06:20 +0000
Message-ID: <20181211220620.GS6686@sirena.org.uk>
References: <E1gWnrV-00086U-3m@optimist>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5161394574824488240=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <E1gWnrV-00086U-3m@optimist>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, Daniel Scheller <d.scheller@gmx.net>
Cc: linaro-kernel@lists.linaro.org, kernel-build-reports@lists.linaro.org, Russell King <linux@armlinux.org.uk>, linux-next@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
List-Id: linux-next.vger.kernel.org


--===============5161394574824488240==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="daC8KDjlMyCcZyAo"
Content-Disposition: inline


--daC8KDjlMyCcZyAo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Dec 11, 2018 at 07:38:33PM +0000, Build bot for Mark Brown wrote:

Today's -next fails to build an arm allmodconfig due to:

> 	arm-allmodconfig
> ../arch/arm/include/asm/irq.h:35:50: error: unknown type name 'cpumask_t'
> ../arch/arm/include/asm/irq.h:36:9: error: unknown type name 'bool'
> ../arch/arm/include/asm/irq.h:35:50: error: unknown type name 'cpumask_t'
> ../arch/arm/include/asm/irq.h:36:9: error: unknown type name 'bool'
> ../arch/arm/include/asm/irq.h:35:50: error: unknown type name 'cpumask_t'
> ../arch/arm/include/asm/irq.h:36:9: error: unknown type name 'bool'
> ../arch/arm/include/asm/irq.h:35:50: error: unknown type name 'cpumask_t'
> ../arch/arm/include/asm/irq.h:36:9: error: unknown type name 'bool'

in ddbridge-ci.c and some other media files.  This is because
ddbridge.h includes asm/irq.h but that does not directly include headers
which define the above types and it appears some header changes have
removed an implicit inclusion of those.  Moving the asm includes after
the linux ones in ddbridge.h fixes this though this appears to be
against the coding style for media.

--daC8KDjlMyCcZyAo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlwQNNsACgkQJNaLcl1U
h9BIhAf/QxLriJgoTE64TXKs4ezWsRnAcKuzXFd4w9zMxqvclE6DzD4fm+SWAq5G
tt93m2jwK8z2TPI1CswtNqTJJB0x3gEwoj9LRnxA0z8W+1PuzS9urBgkxDUdJWQN
9/1v3c0sTzCgBKHcALmQTZdOEQroYfo6YLRDqmWY6W2sPciAlHOBtZePsScCYJZs
dc7bQQiC7G+9WhYqAB6AVjDT/gJy/X9Qz02BkKswOrmmi75r2eICVkYH64QZiCni
hTSMu7ucS8EDBWUE5Mqma9Hpv5Uii35Ts8r15V0mtj3XopczqDrIikauAC0jcCFu
ju9LRTsWKyf8vQU1Lae9yH0afyzBVA==
=kNcS
-----END PGP SIGNATURE-----

--daC8KDjlMyCcZyAo--


--===============5161394574824488240==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============5161394574824488240==--
