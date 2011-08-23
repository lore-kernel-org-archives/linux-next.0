From: Randy Dunlap <rdunlap@xenotime.net>
Subject: Re: linux-next: Tree for Aug 22 (evm)
Date: Mon, 22 Aug 2011 17:49:58 -0700
Message-ID: <20110822174958.73dd96c7.rdunlap@xenotime.net>
References: <20110822145304.980529cb921e5f1321c622da@canb.auug.org.au>
	<20110822125355.bb01d76b.rdunlap@xenotime.net>
	<CACqU3MVjg60pTPyNWm+41w144QzPgtHQ4wZPUUV=vok8gGffuQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from oproxy9.bluehost.com ([69.89.24.6]:51813 "HELO
	oproxy9.bluehost.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1754489Ab1HWAuB convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 22 Aug 2011 20:50:01 -0400
In-Reply-To: <CACqU3MVjg60pTPyNWm+41w144QzPgtHQ4wZPUUV=vok8gGffuQ@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Arnaud Lacombe <lacombar@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Mimi Zohar <zohar@us.ibm.com>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, linux-kbuild@vger.kernel.org

On Mon, 22 Aug 2011 20:47:00 -0400 Arnaud Lacombe wrote:

> Hi,
>=20
> On Mon, Aug 22, 2011 at 3:53 PM, Randy Dunlap <rdunlap@xenotime.net> =
wrote:
> > On Mon, 22 Aug 2011 14:53:04 +1000 Stephen Rothwell wrote:
> >
> >> Hi all,
> >>
> >> [The kernel.org mirroring is a bit low today]
> >
> > (on x86_64:)
> >
> > When CONFIG_EVM=3Dy, CONFIG_CRYPTO_HASH2=3Dm, CONFIG_TRUSTED_KEYS=3D=
m,
> > CONFIG_ENCRYPTED_KEYS=3Dm, the build fails with:
> >
> You did not provide the value of CONFIG_TCG_TPM, I'll assume it was
> 'm'. That said, correct me if I'm wrong, but we currently have:

Yes, it was 'm'.

> menuconfig TCG_TPM
>         tristate "TPM Hardware Support"
>=20
> [...]
>=20
> config EVM
>         boolean "EVM support"
>         depends on SECURITY && KEYS && TCG_TPM
>=20
> which seems terribly broken to me... How can you have a built-in
> feature, which depends on another potentially-not-built-in feature ?

Yup.

> If you change EVM to 'tristate', you will see that you are not allowe=
d
> to make it built-in if TCG_TPM is not built-in.

Right.

>  - Arnaud
>=20
> > (.text+0x378aa): undefined reference to `key_type_encrypted'
> > evm_crypto.c:(.text+0x37992): undefined reference to `crypto_alloc_=
shash'
> > evm_crypto.c:(.text+0x37a24): undefined reference to `crypto_shash_=
setkey'
> > evm_crypto.c:(.text+0x37ad9): undefined reference to `crypto_shash_=
update'
> > evm_crypto.c:(.text+0x37aeb): undefined reference to `crypto_shash_=
final'
> > (.text+0x37b4b): undefined reference to `crypto_shash_update'
> > (.text+0x37c61): undefined reference to `crypto_shash_update'
> > (.text+0x37cb9): undefined reference to `crypto_shash_update'
> >
> > even though EVM (Kconfig) selects ENCRYPTED_KEYS and TRUSTED_KEYS..
> > and even after I add "select CRYPTO_HASH2".
> >
> > Is this because EVM is bool and kconfig is confused about 'select's
> > when a bool is selecting tristates? =A0Shouldn't the tristates beco=
me
> > 'y' instead of 'm' if they are selected by a bool that is 'y'?
> >
> >
> > xconfig shows these symbol values:
> >
> > Symbol: EVM [=3Dy]
> > Type : boolean
> > Prompt: EVM support
> > Defined at security/integrity/evm/Kconfig:1
> > Depends on: SECURITY [=3Dy] && KEYS [=3Dy] && TCG_TPM [=3Dm]
> > Location:
> > -> Security options
> > Selects: CRYPTO_HMAC [=3Dm] && CRYPTO_MD5 [=3Dm] && CRYPTO_SHA1 [=3D=
m] && CRYPTO_HASH2 [=3Dm] && ENCRYPTED_KEYS [=3Dm] && TRUSTED_KEYS [=3D=
m]
> >
> >
> > Hm, changing TCG_TPM to =3Dy also changes TRUSTED_KEYS and ENCRYPTE=
D_KEYS and
> > lots of CRYPTO_ symbols from =3Dm to =3Dy. =A0There must be some ki=
nd of min/max
> > symbol checking that is confused?
> >
> there is definitively an underlying min/max, but I would not point
> finger too fast.


Thanks for your help.

---
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your cod=
e ***
