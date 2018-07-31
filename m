From: Mark Brown <broonie@kernel.org>
Subject: Re: next/master boot: 179 boots: 11 failed, 167 passed with 1
 offline (next-20180731)
Date: Tue, 31 Jul 2018 17:11:14 +0100
Message-ID: <20180731161114.GI5719@sirena.org.uk>
References: <5b607cc4.1c69fb81.6c1d6.6534@mx.google.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6365005439617038189=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <5b607cc4.1c69fb81.6c1d6.6534@mx.google.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-next@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kernel-build-reports@lists.linaro.org
List-Id: linux-next.vger.kernel.org


--===============6365005439617038189==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Li7ckgedzMh1NgdW"
Content-Disposition: inline


--Li7ckgedzMh1NgdW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 31, 2018 at 08:14:12AM -0700, kernelci.org bot wrote:

Today's -next fails to boot on db820c:

> arm64:

>     defconfig:
>         apq8096-db820c:
>             lab-bjorn: new failure (last pass: next-20180730)

There's nothing immediately obvious as the boot failure cause in the
logs, the last output is a failure to load the ath10k_pci firmware:

04:02:53.750283  [    4.503980] ath10k_pci 0000:01:00.0: Failed to find firmware-N.bin (N between 2 and 6) from ath10k/QCA6174/hw3.0: -2
04:02:53.756384  [    4.504010] ath10k_pci 0000:01:00.0: could not fetch firmware files (-2)
04:02:53.760522  [    4.513736] ath10k_pci 0000:01:00.0: could not probe fw (-2)

but I'm not sure that's the actual cause.  More details, including the
full boot log, here:

   https://kernelci.org/boot/id/5b6042b559b514136096babf/

--Li7ckgedzMh1NgdW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAltgiiEACgkQJNaLcl1U
h9DOSQf/S9K/55ETQVj8ByDTgV5aoYyr8QVj/wqrYeC06ihuLC+qXILWKmnub/F/
+GJbKqTAnnKwpqxQSA6KpOTK969P7DWdDlvYzxTDCy6ui8rXejlge4cgQ9+Gwv7C
MBEf/FYqQFXcLiJuqFRw2EDSccfJIOTrjTYB7Qd53SGMYUr+MrOQzlZAcSzUrvX5
oQRJZbofFFd4mlihm+1zB4mLmj6KTTa4/WiQj4ppD5oGv0CDWIGQEHV+fpfVyLR5
tRb5Fbar06ogYSLhhmsLdkf2Nisg7AdQSJKSioJHlszYJx68q5PcRzyh0WfF7x0A
5cLfR9CMWa+BDKcbO15cd2Wc2HT+iw==
=aPRB
-----END PGP SIGNATURE-----

--Li7ckgedzMh1NgdW--


--===============6365005439617038189==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============6365005439617038189==--
