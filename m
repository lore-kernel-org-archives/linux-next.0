Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CE2F44E044;
	Mon, 18 May 2026 16:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779121319; cv=none; b=BGZ7jkt/WNW8oRGPPcKib5hQ8kOKoJ+d3YVh+ePUEoRLq+53IoviUn88pypaPO4I14gbDgRKzBViEsYb+xl/dDwcEAIdm3OLB/L2lJmMPuDta5d162mubv1qHvvKNJWFwN1Jpa+ND8vGJBhmIsv7wblw/BHPRxqDflaub7gbVIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779121319; c=relaxed/simple;
	bh=FmtzOuoJd1Xk+1yoUYvgEeYvuoC1Dm/VfLvcafAGiGc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=c/4zDF2D4JONGtNbkJPmu4PhN1htD+oo4mqgBFwbtxVHyjVbkgNVz/ab9YKJd9oHpfaGocrlxbu1XYuP4dfe1jIRjgfkIU+M8AN6qSqfEr6ey+RHM+u1e9mvODDif6gLRm+WQVCNDCbzihcdH8GiNTo236GhC78S3OINvJPtFts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V4ouIsfG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V4ouIsfG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F13DFC2BCB7;
	Mon, 18 May 2026 16:21:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779121318;
	bh=FmtzOuoJd1Xk+1yoUYvgEeYvuoC1Dm/VfLvcafAGiGc=;
	h=Date:From:To:Cc:Subject:From;
	b=V4ouIsfGykSl5fCb2HDkHj+W3ho6mDJrB5dD5oFJw1yjVSpKWPPwp3MaEHDjDeszJ
	 xFxfc3i51IGklLQ2wJ+7DjaQUh1NB93fe7D9lPM2ARozY9VI1K5+HUW/0PFyXeQRlh
	 xSmkomX5Yx+RIMG4jNyjdt/IVNBH80XHVcNzIDWcLplVEmZKLaX6ZMK+XFAdT6/gWY
	 1pgMQACVtcNX/ERKK7ExCqp8kAQ36Zm+x6GQ63Rvp/TqIYiZUHntvgorKmDBsspLbD
	 oUpQaXbZEDVJBtvb/L08c9Ph7srahJxqZfbLNXu0DJIuDBUUMOrlTRtXTIQcXPrM6v
	 EKZ1dHV7ATOFA==
Date: Mon, 18 May 2026 17:21:54 +0100
From: Mark Brown <broonie@kernel.org>
To: torvalds@linux-foundation.org, Benjamin Tissoires <bentiss@kernel.org>,
	Johan Hovold <johan@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Kosina <jkosina@suse.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure in final build
Message-ID: <ags8osqoMATFBslZ@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rRK4LGJKIlgVtdzh"
Content-Disposition: inline


--rRK4LGJKIlgVtdzh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

During the final build today's linux-next build (i386 defconfig) failed
like this:

In file included from /tmp/next/build/include/linux/device.h:15,
                 from /tmp/next/build/include/linux/input.h:19,
                 from /tmp/next/build/drivers/hid/hid-core.c:25:
/tmp/next/build/drivers/hid/hid-core.c: In function 'hid_report_raw_event':
/tmp/next/build/drivers/hid/hid-core.c:2053:43: error: format '%ld' expects argument of type 'long int', but argument 5 has type 'size_t' {aka 'unsigned int'} [-Werror=format=]
 2053 |                 hid_warn_ratelimited(hid, "Event data for report %d is incorrect (%d vs %ld)\n",
      |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/tmp/next/build/include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
  110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
      |                              ^~~
/tmp/next/build/include/linux/dev_printk.h:156:61: note: in expansion of macro 'dev_fmt'
  156 |         dev_printk_index_wrap(_dev_warn, KERN_WARNING, dev, dev_fmt(fmt), ##__VA_ARGS__)
      |                                                             ^~~~~~~
/tmp/next/build/include/linux/dev_printk.h:215:17: note: in expansion of macro 'dev_warn'
  215 |                 dev_level(dev, fmt, ##__VA_ARGS__);                     \
      |                 ^~~~~~~~~
/tmp/next/build/include/linux/dev_printk.h:227:9: note: in expansion of macro 'dev_level_ratelimited'
  227 |         dev_level_ratelimited(dev_warn, dev, fmt, ##__VA_ARGS__)
      |         ^~~~~~~~~~~~~~~~~~~~~
/tmp/next/build/include/linux/hid.h:1342:9: note: in expansion of macro 'dev_warn_ratelimited'
 1342 |         dev_warn_ratelimited(&(hid)->dev, fmt, ##__VA_ARGS__)
      |         ^~~~~~~~~~~~~~~~~~~~
/tmp/next/build/drivers/hid/hid-core.c:2053:17: note: in expansion of macro 'hid_warn_ratelimited'
 2053 |                 hid_warn_ratelimited(hid, "Event data for report %d is incorrect (%d vs %ld)\n",
      |                 ^~~~~~~~~~~~~~~~~~~~
/tmp/next/build/drivers/hid/hid-core.c:2053:91: note: format string is defined here
 2053 |                 hid_warn_ratelimited(hid, "Event data for report %d is incorrect (%d vs %ld)\n",
      |                                                                                         ~~^
      |                                                                                           |
      |                                                                                           long int
      |                                                                                         %d
/tmp/next/build/drivers/hid/hid-core.c:2075:43: error: format '%ld' expects argument of type 'long int', but argument 5 has type 'size_t' {aka 'unsigned int'} [-Werror=format=]
 2075 |                 hid_warn_ratelimited(hid, "Event data for report %d was too short (%d vs %ld)\n",
      |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/tmp/next/build/include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
  110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
      |                              ^~~
/tmp/next/build/include/linux/dev_printk.h:156:61: note: in expansion of macro 'dev_fmt'
  156 |         dev_printk_index_wrap(_dev_warn, KERN_WARNING, dev, dev_fmt(fmt), ##__VA_ARGS__)
      |                                                             ^~~~~~~
/tmp/next/build/include/linux/dev_printk.h:215:17: note: in expansion of macro 'dev_warn'
  215 |                 dev_level(dev, fmt, ##__VA_ARGS__);                     \
      |                 ^~~~~~~~~
/tmp/next/build/include/linux/dev_printk.h:227:9: note: in expansion of macro 'dev_level_ratelimited'
  227 |         dev_level_ratelimited(dev_warn, dev, fmt, ##__VA_ARGS__)
      |         ^~~~~~~~~~~~~~~~~~~~~
/tmp/next/build/include/linux/hid.h:1342:9: note: in expansion of macro 'dev_warn_ratelimited'
 1342 |         dev_warn_ratelimited(&(hid)->dev, fmt, ##__VA_ARGS__)
      |         ^~~~~~~~~~~~~~~~~~~~
/tmp/next/build/drivers/hid/hid-core.c:2075:17: note: in expansion of macro 'hid_warn_ratelimited'
 2075 |                 hid_warn_ratelimited(hid, "Event data for report %d was too short (%d vs %ld)\n",
      |                 ^~~~~~~~~~~~~~~~~~~~
/tmp/next/build/drivers/hid/hid-core.c:2075:92: note: format string is defined here
 2075 |                 hid_warn_ratelimited(hid, "Event data for report %d was too short (%d vs %ld)\n",
      |                                                                                          ~~^
      |                                                                                            |
      |                                                                                            long int
      |                                                                                          %d
cc1: all warnings being treated as errors

Caused by commit

   2c85c61d1332e (HID: pass the buffer size to hid_report_raw_event)

for which I applied a revert (note that the commit is in Linus' tree),
also covering 206342541fc88 (HID: core: introduce
hid_safe_input_report()).

--rRK4LGJKIlgVtdzh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoLPKEACgkQJNaLcl1U
h9DH2Qf/TYCUfjJpja7WQiFqolJvZPz7QlRsnsqwWGPjumKcnRjGysjr/SIcmAYp
sc1f0hA0ThY10EbLBmOp0WGUsZtg5S9ecYe0Ii3q8r86wfyKAgXx0do4jixxpHUT
gBw6OsGpnMWJsE96ZFDYIKso62dGlbuhNWuKxG9UAO2KD0PqIa0g5LGjfx7S1eS1
PYiuhToFg14dTLoImtOnsWHJRSWgtrZS/rL0TAzUBu8jKalQ7g5CoCyiK3Qnz1ll
H6B2VxACb9V6QwSsYQWx4wA1VUwGjZ3Csnz+GiBGLwhDk24IRAMKuBIRnBvXE08e
y4WyYAxhjLIAj/NdWa5D9g1w2IdQeQ==
=fFtb
-----END PGP SIGNATURE-----

--rRK4LGJKIlgVtdzh--
