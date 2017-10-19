From: Felipe Balbi <balbi@kernel.org>
Subject: Re: linux-next: manual merge of the usb-gadget tree with the usb tree
Date: Thu, 19 Oct 2017 10:37:34 +0300
Message-ID: <87fuafio5d.fsf@linux.intel.com>
References: <20171018144235.onumhg5fqmboodo6@sirena.co.uk> <CAGXu5j+zORWwifQ7DPg6LkNNsKm0uPSR=pkGaF=GQ5kGOtURsg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga06.intel.com ([134.134.136.31]:13974 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751569AbdJSHht (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 19 Oct 2017 03:37:49 -0400
In-Reply-To: <CAGXu5j+zORWwifQ7DPg6LkNNsKm0uPSR=pkGaF=GQ5kGOtURsg@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Kees Cook <keescook@chromium.org>, Mark Brown <broonie@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Allen Pais <allen.lkml@gmail.com>, linux-usb@vger.kernel.org, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi,

Kees Cook <keescook@chromium.org> writes:
> On Wed, Oct 18, 2017 at 7:42 AM, Mark Brown <broonie@kernel.org> wrote:
>> Hi Felipe,
>>
>> Today's linux-next merge of the usb-gadget tree got a conflict in:
>>
>>   drivers/usb/gadget/udc/snps_udc_core.c
>>
>> between commit:
>>
>>   29bce57723351f63d ("usb/gadget/snps_udc_core: Convert timers to use ti=
mer_setup()")
>>
>> from the usb tree and commit:
>>
>>   46b614affda8667f9 ("usb: gadget: udc: snps_udc_core: use setup_timer()=
 helper.")
>>
>> from the usb-gadget tree.
>>
>> I fixed it up by taking the USB version and can carry the fix as
>> necessary. This is now fixed as far as linux-next is concerned, but any
>> non trivial conflicts should be mentioned to your upstream maintainer
>> when your tree is submitted for merging.  You may also want to consider
>> cooperating with the maintainer of the conflicting tree to minimise any
>> particularly complex conflicts.
>
> FWIW, timer_setup() should be preferred over setup_timer().

I'll drop the one from my tree.

thanks

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAlnoVj8ACgkQzL64meEa
mQZ1xRAAmKoVB9izJpOfN/UTijxsRhO1a3kNHDgvvhoLKPB57mweHxCE0HhuKJyd
pcnBuphOdblu/lrdFrdWTlwdua2ImJZvMiKEF3r+WJuRh/vCRQiyFUYaM1H6tZVt
CUQ7uMz8FKbtZ6hcLIQLx1bX08/4i+2qP4CE7qO7ang08NLh42PSbud5qPhBaNK/
kF7GQ0A4bkC+HAoRtyN/nztmaG0f1pLntkj6lMQHWa9YFNaSHXUr368VyVzlnowW
B/8ADxGhLbQYA2fCL4aHHOT6MrKur/Fyp4b0fXulisdcTL3gbvc5aLMn3ub8WLAE
c3dowEqwsrSpBXIes9Aq0gknDteM9VGCwJY2EIj3r9aGLETv2njEVYG/UwHJ0WRA
DtmxA9khDJhsiTS+w4elg7haofb0SiPvC0+OXH1QXEFF/CHLDVxvUWHstKIVHQ3d
LoZnPy058niNltp+AaICZYGenWycdFGobsF3ODih1boveQkzWNBE3tFDol/bJ6KX
6lH868QB536VH2Lna90VFqY2qGDNsoR3bNhgyOP9XUus3SJKyh0k37J0GaeiU5uP
HaUupzVsscAiY9TxENlFuVfTGKtLR4QmYkkc3wg1UE1VDryHsNHuPF5OZ7dZP+pz
D5p+ZcT9yzhLKTarrh6OuzPQV/izSc7kJgwYQNzp5Gr6hpvxH7I=
=0IkV
-----END PGP SIGNATURE-----
--=-=-=--
