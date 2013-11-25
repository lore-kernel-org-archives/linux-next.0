From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: randconfig build error with next-20131125, in drivers/iio/light
Date: Mon, 25 Nov 2013 17:13:09 +0000
Message-ID: <1bbe329e-a128-4d08-b79c-d9285dbf4aae@email.android.com>
References: <CA+r1ZhinxJBB3dgCKxoMXV0ioVR0jrS7ha=SY-qT212AvDSkVQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CA+r1ZhinxJBB3dgCKxoMXV0ioVR0jrS7ha=SY-qT212AvDSkVQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jim Davis <jim.epost-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>, linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-next.vger.kernel.org

Thanks for the report. We have a fix queued up. I have just been a bit =
lax sending the pull request. Note I believe the issue is in Linus' tre=
e as well.

Thanks again

Jonathan

Jim Davis <jim.epost-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>Building with the attached random configuration file,
>
>drivers/iio/light/tcs3472.c: In function =E2=80=98tcs3472_trigger_hand=
ler=E2=80=99:
>drivers/iio/light/tcs3472.c:195:2: error: implicit declaration of
>function =E2=80=98iio_push_to_buffers_with_timestamp=E2=80=99
>[-Werror=3Dimplicit-function-declaration]
>  iio_push_to_buffers_with_timestamp(indio_dev, data->buffer,
>  ^
>cc1: some warnings being treated as errors
>make[3]: *** [drivers/iio/light/tcs3472.o] Error 1

--=20
Sent from my Android phone with K-9 Mail. Please excuse my brevity.
