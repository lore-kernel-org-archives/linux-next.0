From: Arnaud Lacombe <lacombar@gmail.com>
Subject: Re: linux-next: Tree for Aug 22 (evm)
Date: Mon, 22 Aug 2011 16:18:00 -0400
Message-ID: <CACqU3MVRvGJTRwSmvimGi-js=CvS9Uyq6K7cA8+6vfH1tdnS6Q@mail.gmail.com>
References: <20110822145304.980529cb921e5f1321c622da@canb.auug.org.au>
	<20110822125355.bb01d76b.rdunlap@xenotime.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kbuild-owner@vger.kernel.org>
In-Reply-To: <20110822125355.bb01d76b.rdunlap@xenotime.net>
Sender: linux-kbuild-owner@vger.kernel.org
To: Randy Dunlap <rdunlap@xenotime.net>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Mimi Zohar <zohar@us.ibm.com>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, linux-kbuild@vger.kernel.org
List-Id: linux-next.vger.kernel.org

Hi,

On Mon, Aug 22, 2011 at 3:53 PM, Randy Dunlap <rdunlap@xenotime.net> wr=
ote:
> On Mon, 22 Aug 2011 14:53:04 +1000 Stephen Rothwell wrote:
>
>> Hi all,
>>
>> [The kernel.org mirroring is a bit low today]
>
> (on x86_64:)
>
> When CONFIG_EVM=3Dy, CONFIG_CRYPTO_HASH2=3Dm, CONFIG_TRUSTED_KEYS=3Dm=
,
> CONFIG_ENCRYPTED_KEYS=3Dm, the build fails with:
>
> (.text+0x378aa): undefined reference to `key_type_encrypted'
> evm_crypto.c:(.text+0x37992): undefined reference to `crypto_alloc_sh=
ash'
> evm_crypto.c:(.text+0x37a24): undefined reference to `crypto_shash_se=
tkey'
> evm_crypto.c:(.text+0x37ad9): undefined reference to `crypto_shash_up=
date'
> evm_crypto.c:(.text+0x37aeb): undefined reference to `crypto_shash_fi=
nal'
> (.text+0x37b4b): undefined reference to `crypto_shash_update'
> (.text+0x37c61): undefined reference to `crypto_shash_update'
> (.text+0x37cb9): undefined reference to `crypto_shash_update'
>
> even though EVM (Kconfig) selects ENCRYPTED_KEYS and TRUSTED_KEYS..
> and even after I add "select CRYPTO_HASH2".
>
> Is this because EVM is bool and kconfig is confused about 'select's
> when a bool is selecting tristates? =A0Shouldn't the tristates become
> 'y' instead of 'm' if they are selected by a bool that is 'y'?
>
hum, I'd say that it should:

% cat Kconfig
config MOD
        bool
        default y
        option modules

config B
        tristate "B"
        default m

config A
        tristate "A"
        default y
        select B

% make alldefconfig
scripts/kconfig/conf --alldefconfig Kconfig
#
# configuration written to .config
#

% cat .config
#
# Automatically generated file; DO NOT EDIT.
# Linux Kernel Configuration
#
CONFIG_MOD=3Dy
CONFIG_B=3Dy
CONFIG_A=3Dy

now, if A defaults to 'm', we have:

% cat .config
#
# Automatically generated file; DO NOT EDIT.
# Linux Kernel Configuration
#
CONFIG_MOD=3Dy
CONFIG_B=3Dm
CONFIG_A=3Dm

Could you please produce a reduced testcase showing the problem ?

Thanks,
 - Arnaud

>
> xconfig shows these symbol values:
>
> Symbol: EVM [=3Dy]
> Type : boolean
> Prompt: EVM support
> Defined at security/integrity/evm/Kconfig:1
> Depends on: SECURITY [=3Dy] && KEYS [=3Dy] && TCG_TPM [=3Dm]
> Location:
> -> Security options
> Selects: CRYPTO_HMAC [=3Dm] && CRYPTO_MD5 [=3Dm] && CRYPTO_SHA1 [=3Dm=
] && CRYPTO_HASH2 [=3Dm] && ENCRYPTED_KEYS [=3Dm] && TRUSTED_KEYS [=3Dm=
]
>
>
> Hm, changing TCG_TPM to =3Dy also changes TRUSTED_KEYS and ENCRYPTED_=
KEYS and
> lots of CRYPTO_ symbols from =3Dm to =3Dy. =A0There must be some kind=
 of min/max
> symbol checking that is confused?
>
> ---
> ~Randy
> *** Remember to use Documentation/SubmitChecklist when testing your c=
ode ***
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kbuil=
d" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
--
To unsubscribe from this list: send the line "unsubscribe linux-kbuild"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
