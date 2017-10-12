From: Luciano Coelho <luciano.coelho@intel.com>
Subject: Re: linux-next: manual merge of the wireless-drivers-next tree with
 the wireless-drivers tree
Date: Thu, 12 Oct 2017 21:16:36 +0300
Message-ID: <1507832196.5497.1.camel@intel.com>
References: <20171012172512.tlsdjhppfz2hu4vr@sirena.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171012172512.tlsdjhppfz2hu4vr@sirena.co.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>, Kalle Valo <kvalo@codeaurora.org>, Chaya Rachel Ivgi <chaya.rachel.ivgi@intel.com>, Shahar S Matityahu <shahar.s.matityahu@intel.com>, Wireless <linux-wireless@vger.kernel.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Thu, 2017-10-12 at 18:25 +0100, Mark Brown wrote:
> Hi all,

Hi Mark,


> Today's linux-next merge of the wireless-drivers-next tree got a
> conflict in:
> 
>   drivers/net/wireless/intel/iwlwifi/iwl-config.h
> 
> between commit:
> 
>    dd05f9aab4426f ("iwlwifi: pcie: dynamic Tx command queue size")
> 
> from the wireless-drivers tree and commit:
> 
>    44fd09dad5d2b7 ("iwlwifi: nvm: set the correct offsets to 3168
> series")
> 
> from the wireless-drivers-next tree.

This is weird... The previous conflict was the exact opposite of this. 
44fd09 came in from wireless-drivers and dd05f9 came from wireless-
drivers-next.  I don't understand why it is saying the opposite here...

--
Cheers,
Luca.
