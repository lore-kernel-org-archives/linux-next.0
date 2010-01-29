From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: driver-core tree build warning
Date: Fri, 29 Jan 2010 18:21:15 +1100
Message-ID: <20100129182115.99918a0e.sfr@canb.auug.org.au>
References: <20100119172741.2dd81553.sfr@canb.auug.org.au>
	<20100119210417.GC10928@kroah.com>
	<20100120104525.752a790f.sfr@canb.auug.org.au>
	<20100120172543.e884a8af.sfr@canb.auug.org.au>
	<20100120174441.e1b12fd7.sfr@canb.auug.org.au>
	<20100121231010.GB29796@kroah.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__29_Jan_2010_18_21_15_+1100_2T.xKadDqOxJl1.o"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:47853 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752977Ab0A2HVU (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 29 Jan 2010 02:21:20 -0500
In-Reply-To: <20100121231010.GB29796@kroah.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Andi Kleen <andi@firstfloor.org>

--Signature=_Fri__29_Jan_2010_18_21_15_+1100_2T.xKadDqOxJl1.o
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Greg,

On Thu, 21 Jan 2010 15:10:10 -0800 Greg KH <greg@kroah.com> wrote:
>
> Here's a patch that I just applied to my tree to hopefully resolve this
> issue.

I still get the warnings.

> -static CLASS_ATTR(probe, S_IWUSR, NULL, cpu_probe_store);
> -static CLASS_ATTR(release, S_IWUSR, NULL, cpu_release_store);
> +static SYSDEV_ATTR(probe, S_IWUSR, NULL, cpu_probe_store);

This defines attr_probe as a "struct sysdev_attribute" whose attr element
is a "struct attribute".

> +static SYSDEV_ATTR(release, S_IWUSR, NULL, cpu_release_store);
>  #endif /* CONFIG_ARCH_CPU_PROBE_RELEASE */
> =20
>  #else /* ... !CONFIG_HOTPLUG_CPU */
> @@ -261,8 +261,8 @@ int __init cpu_dev_init(void)
> =20
>  static struct sysdev_class_attribute *cpu_sysdev_class_attrs[] =3D {
>  #ifdef CONFIG_ARCH_CPU_PROBE_RELEASE
> -	&class_attr_probe.attr,
> -	&class_attr_release.attr,
> +	&attr_probe.attr,

so here we are initialising a "struct sysdev_class_attribute *" with a
"struct attribute *".  Thus the warning.

> +	&attr_release.attr,

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__29_Jan_2010_18_21_15_+1100_2T.xKadDqOxJl1.o
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAktijGsACgkQjjKRsyhoI8zH1wCfeqfUM2wHjY0JIo8S6YDAtt5Q
ccQAn3BhYTckMb1H5JZD6TrVTeGbYOGz
=9ZOD
-----END PGP SIGNATURE-----

--Signature=_Fri__29_Jan_2010_18_21_15_+1100_2T.xKadDqOxJl1.o--
