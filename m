Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87B8444A40F;
	Fri, 14 Aug 2026 10:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786704972; cv=none; b=BEwDZLZYyvzE5+DC3bjoO3xLwLbbM56sOES30fbzOLfm2HJZGbD3XGAaqkS5TZSwDN9Vfns+GxAK2BSJ2EOFX/vHkigxKxxXE4UEQ8O6W02BrRgKBKbI/8xtod5iWS9Nd4eCGtpCW4ZFl+1trCjDOhdtAUjF7Mkw7jKLhM3kuyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786704972; c=relaxed/simple;
	bh=3jX4OkyjHVDfMso2xbPwa6n3Iw2WmiTvPUi8AR0ajKI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NqVbCwJ/SA2fJ8cynnTYRmrS5+AE/42/f3KbDdxnSiIxAgWHcpSHmHhLeM1BDJIF9JVKSWGxDBJzOb/GAyqM1O8n/ulQNO2vJodmyut9BUn57+luNCZwK2cp4ERJB8IkePVxQvxP04P4w4Qmrj2RGzJnNFi/lh+9tcOlL3DEY2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IwrP+5xa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IwrP+5xa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EB621F000E9;
	Fri, 14 Aug 2026 10:56:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786704962;
	bh=PLwNIsGhPqq7aMMup7W1q/kjH9D6Dfu8OtnAixyctek=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IwrP+5xaiGVYjoxB5qnktvhjKYGa8pUETJh7majAyY1ajQaVu+kFmlsjp/ZhubEtn
	 BFQU3JAWaJqQov68LgzO7uEFkqhFcQsDvJtdsIFidEVt3Z4/Kxze1qwIFg51z3Ax+e
	 YdGBaxgJ9OKuIRWcUQK6lRDi4R9a+KQeIMJ6vwGQh3JQIJbv3olbcHHgslvRMx0L9Q
	 kNC1KCmQ6/BxlDBcebHkdXih71WexZIy9rbYVg+XSSc4jbTvRQ/0vQjvg2qBNXBv2F
	 7zMBK++YOOou40S6vtVNHHF8tey8tC4s/IJhbmujkY+GTGTil/4Kqdyb7F5kCwqnax
	 oq15bR6BR7zVA==
Date: Fri, 14 Aug 2026 12:55:54 +0200
From: Joel Granados <joel.granados@kernel.org>
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Gregory Price <gourry@gourry.net>, 
	Peter Zijlstra <peterz@infradead.org>, Andy Lutomirski <luto@kernel.org>, Kees Cook <kees@kernel.org>, 
	Oleg Nesterov <oleg@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Mark Brown <broonie@kernel.org>, 
	Stephen Rothwell <sfr@canb.auug.org.au>, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-next@vger.kernel.org
Subject: Re: [PATCH] syscall_user_dispatch: Use CONFIG_SYSCTL for sysctl guard
Message-ID: <mnqdw5ldn7xeif6xyfkf3m2stl42np47dlhqj5tt5czur6n3mt@aufccz5rwjhx>
References: <20260813062039.14567-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5fbyjxpw63cnkq2z"
Content-Disposition: inline
In-Reply-To: <20260813062039.14567-1-kmehltretter@gmail.com>


--5fbyjxpw63cnkq2z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 13, 2026 at 08:20:39AM +0200, Karl Mehltretter wrote:
> sysctl-next removes CONFIG_PROC_SYSCTL because it mirrors CONFIG_SYSCTL.
> When combined with the syscall user dispatch sysctl in linux-next, the
> stale guard prevents registration of kernel.syscall_user_dispatch.
>=20
> syscall_user_dispatch_allowed defaults to true. SUD therefore remains
> available, but administrators cannot disable new activations.
>=20
> Use CONFIG_SYSCTL for the guard and documentation.
>=20
> Fixes: 5b6e32ba7b59 ("syscall_user_dispatch: Add kernel.syscall_user_disp=
atch sysctl")
> Assisted-by: Codex:gpt-5.6-sol
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
> ---
> The conflicting sysctl-next commit is currently:
>=20
>   8d75c338f0bc ("sysctl: remove CONFIG_PROC_SYSCTL, it just mirrors CONFI=
G_SYSCTL")
>=20
> This is a cross-tree integration fix intended for the tip tree. It has
> no functional effect in tip/master, but restores the sysctl when
> combined with sysctl-next.
>=20
> Verified in linux-next with an x86_64 object build using
> CONFIG_SYSCALL_USER_DISPATCH=3Dy and CONFIG_SYSCTL=3Dy.
>=20
>  Documentation/admin-guide/sysctl/kernel.rst | 2 +-
>  kernel/entry/syscall_user_dispatch.c        | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/Documentation/admin-guide/sysctl/kernel.rst b/Documentation/=
admin-guide/sysctl/kernel.rst
> index b6328cd0f43e9..ffea61d448ebb 100644
> --- a/Documentation/admin-guide/sysctl/kernel.rst
> +++ b/Documentation/admin-guide/sysctl/kernel.rst
> @@ -1416,7 +1416,7 @@ Controls whether userspace may arm Syscall User Dis=
patch via
>    =3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =20
>  Only present when the kernel is built with ``CONFIG_SYSCALL_USER_DISPATC=
H``
> -and ``CONFIG_PROC_SYSCTL``.
> +and ``CONFIG_SYSCTL``.
> =20
> =20
>  sysctl_writes_strict
> diff --git a/kernel/entry/syscall_user_dispatch.c b/kernel/entry/syscall_=
user_dispatch.c
> index 2002c7aae4358..59c861866941d 100644
> --- a/kernel/entry/syscall_user_dispatch.c
> +++ b/kernel/entry/syscall_user_dispatch.c
> @@ -178,7 +178,7 @@ int syscall_user_dispatch_set_config(struct task_stru=
ct *task, unsigned long siz
>  					      (char __user *)(uintptr_t)cfg.selector);
>  }
> =20
> -#ifdef CONFIG_PROC_SYSCTL
> +#ifdef CONFIG_SYSCTL
>  static const struct ctl_table syscall_user_dispatch_sysctls[] =3D {
>  	{
>  		.procname	=3D "syscall_user_dispatch",
> @@ -195,4 +195,4 @@ static int __init syscall_user_dispatch_sysctl_init(v=
oid)
>  	return 0;
>  }
>  late_initcall(syscall_user_dispatch_sysctl_init);
> -#endif /* CONFIG_PROC_SYSCTL */
> +#endif /* CONFIG_SYSCTL */
Reviewed-by: Joel Granados <joel.granados@kernel.org>

This looks good to me. It still depends on sysctl-next getting upstream.
I don't see why that would not happen, but it is worth checking after
the merge window if this change is still valid.

Best

Joel

--5fbyjxpw63cnkq2z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEErkcJVyXmMSXOyyeQupfNUreWQU8FAmp+9DoACgkQupfNUreW
QU8yowv+Jm1OYEFgCoxktJufOqk0plTgQc2knGnh5cYYuLwQUV7ZEqJ19eZv50TY
H3Xx+CcMdAp7O3bv5e7aaA64fEX1LszCm+a8eRHjQJ7M/efuh4h+SbNs/b0Y82+G
zb7UF4iA90C9kHpmFC8DF5l4qkMwPwUaa2TOBIiKJklq1xwz8/PensAp/3NrIkrK
6HNPoiMHQuXmoqS7bdYDl9xKHPg2OftWi/0s3sBmwSG3ABk5iEQiJieVi55U1aIr
xzZM/wfDCzmW3X3JOoVwrzisl+OmHD+6XczXErIe6zhzEUwCR51vIyPMRG56L4sq
H9qjaOdLUq7vyTsumtBEKfbS8Gib4T2dtT9xaNKV3TMAMoAhfRFcYDgZm0zQchQE
4bX675/Gwjb2QD0jclBy8EW4wk4aW6uOody5g7YBz0XinXpUtsriM91PaD+ecABW
2rPe0GcMJkxVCz5LElbH8xJNaz/nhX8xYkn44XvaAtMyJOrlrrIxyVuJzxiAU6MY
kIICHTl3
=ubzy
-----END PGP SIGNATURE-----

--5fbyjxpw63cnkq2z--
