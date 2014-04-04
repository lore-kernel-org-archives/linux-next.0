From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] topology: Fix compilation warning when not in SMP
Date: Fri, 4 Apr 2014 16:49:43 -0700
Message-ID: <20140404234943.GA14633@kroah.com>
References: <1396593798-29173-1-git-send-email-vincent.stehle@laposte.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <stable-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1396593798-29173-1-git-send-email-vincent.stehle@laposte.net>
Sender: stable-owner@vger.kernel.org
To: Vincent =?iso-8859-1?Q?Stehl=E9?= <vincent.stehle@laposte.net>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, stable@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Fri, Apr 04, 2014 at 08:43:18AM +0200, Vincent Stehl=C3=A9 wrote:
> The topology_##name() macro does not use its argument when CONFIG_SMP=
 is not
> set, as it ultimately calls the cpu_data() macro.
>=20
> So we avoid maintaining a possibly unused `cpu' variable, to avoid th=
e
> following compilation warning:
>=20
>   drivers/base/topology.c: In function =E2=80=98show_physical_package=
_id=E2=80=99:
>   drivers/base/topology.c:103:118: warning: unused variable =E2=80=98=
cpu=E2=80=99 [-Wunused-variable]
>    define_id_show_func(physical_package_id);
>=20
>   drivers/base/topology.c: In function =E2=80=98show_core_id=E2=80=99=
:
>   drivers/base/topology.c:106:106: warning: unused variable =E2=80=98=
cpu=E2=80=99 [-Wunused-variable]
>    define_id_show_func(core_id);
>=20
> This can be seen with e.g. x86 defconfig and CONFIG_SMP not set.
>=20
> Signed-off-by: Vincent Stehl=C3=A9 <vincent.stehle@laposte.net>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: <stable@vger.kernel.org> # 3.10.x
> Cc: <stable@vger.kernel.org> # 3.13.x
> Cc: <stable@vger.kernel.org> # 3.14.x

Warnings aren't a stable kernel issue, so why would this be relevant
there?

thanks,

greg k-h
