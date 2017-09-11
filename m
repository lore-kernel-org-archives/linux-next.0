From: Benson Leung <bleung@google.com>
Subject: Re: linux-next: Signed-off-by missing for commit in the
 chrome-platform tree
Date: Mon, 11 Sep 2017 16:50:49 -0700
Message-ID: <20170911235049.GA96165@decatoncale.mtv.corp.google.com>
References: <20170912094504.08a878e0@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="J2SCkAp4GZ/dPZZf"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pg0-f50.google.com ([74.125.83.50]:35400 "EHLO
        mail-pg0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751028AbdIKXuy (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 11 Sep 2017 19:50:54 -0400
Received: by mail-pg0-f50.google.com with SMTP id 188so18112697pgb.2
        for <linux-next@vger.kernel.org>; Mon, 11 Sep 2017 16:50:53 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <20170912094504.08a878e0@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>


--J2SCkAp4GZ/dPZZf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Stephen,

On Tue, Sep 12, 2017 at 09:45:04AM +1000, Stephen Rothwell wrote:
> Hi Benson,
>=20
> Commits
>=20
>   b8b9f5d4a441 ("platform/chrome: Use proper protocol transfer function")
>   19601fbb7d96 ("platform/chrome: cros_ec: sysfs: Modify error handling")
>   3bd61d4d1d9e ("platform/chrome: cros_ec: Add sysfs entry to set keyboar=
d wake lid angle")
>=20
> are missing a Signed-off-by from their committer.
>=20

Whoops. My mistake. Will fix. Thanks!

> --=20
> Cheers,
> Stephen Rothwell

--=20
Benson Leung
Staff Software Engineer
Chrome OS Kernel
Google Inc.
bleung@google.com
Chromium OS Project
bleung@chromium.org

--J2SCkAp4GZ/dPZZf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJZtyFZAAoJEB8J9XsKL+ZYH9MP/0YxFZ7yXNADY3gZ5ZLya9zN
pzGY9fLd5P7t6H0XT8LdkbaZBMUX5fDVRT+jIp4Oz3geO31em+csO6NToN6ZBL4+
8d/7+/fAtZZ4ox7vcxtdEBJkHK8gYlDCeqs+jxMSHTpGz5BQNkNgLEsD7DirRpMO
RY54Q4FcjzMuSUbnbZWv4c7kOwtNpwLU0e8mZVI73y3KRg8u1yKvkxMCeFMMq1YO
nXvVSzztlIekZ8qGq55hOq5alefbFOWE2vArW3AR+ffF3tOaOqGW2UBv06D2vcTA
XyXd7VbM95JHnXiAWtYzH0vg3f6ffE1V8w4CiXgt1klUdg42d/07koGet2rWLYob
pe8bVB0WqbTN+KBc7FGDehr0DT/zahkCgG/VXg9OrJD3LjVAmoo1OE+sf/9nIvNN
lW0gJu7P49my6o89/NQpl7feyeqGZKdKOWL+brJ1qyl8AU9x8LezK8rsa/I582hW
OTLMN+L9xXSl99kI8QQ3hO7B7Jws2HL93CjL7CHruEoaZbOJ6kVqaUAGwz2xGy/j
GOlumJQ+q+eWuB4sNZVybNZnmaYZzh1sBTCBfa9sYoYSgAN6VAnMpbKkib0mJBcK
G94PogxAC10kFLdd8HZL/SVdRj+JfvcyR80nAoebzIz/IRt7yl/2aldXcr/3DChP
R+zTCLMpmhqoSFeuGwDM
=uBAg
-----END PGP SIGNATURE-----

--J2SCkAp4GZ/dPZZf--
