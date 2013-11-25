From: Borislav Petkov <bp-Gina5bIWoIWzQB+pC5nmwQ@public.gmane.org>
Subject: Re: randconfig build error with next-20131125, in drivers/iio/light
Date: Mon, 25 Nov 2013 18:13:01 +0100
Message-ID: <20131125171301.GB11463@pd.tnic>
References: <CA+r1ZhinxJBB3dgCKxoMXV0ioVR0jrS7ha=SY-qT212AvDSkVQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CA+r1ZhinxJBB3dgCKxoMXV0ioVR0jrS7ha=SY-qT212AvDSkVQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jim Davis <jim.epost-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>, linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-next.vger.kernel.org

On Mon, Nov 25, 2013 at 10:04:44AM -0700, Jim Davis wrote:
> Building with the attached random configuration file,
>=20
> drivers/iio/light/tcs3472.c: In function =E2=80=98tcs3472_trigger_han=
dler=E2=80=99:
> drivers/iio/light/tcs3472.c:195:2: error: implicit declaration of
> function =E2=80=98iio_push_to_buffers_with_timestamp=E2=80=99
> [-Werror=3Dimplicit-function-declaration]
>   iio_push_to_buffers_with_timestamp(indio_dev, data->buffer,
>   ^
> cc1: some warnings being treated as errors
> make[3]: *** [drivers/iio/light/tcs3472.o] Error 1

=46eel like giving it a try to write a fix for it? It seems to me
tcs3472.c should depend on IIO_BUFFER... :-)

HTH.

--=20
Regards/Gruss,
    Boris.

Sent from a fat crate under my desk. Formatting is fine.
--
