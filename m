From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: linux-next: build warnings after merge of the wireless-drivers-next tree
Date: Wed, 19 Dec 2018 14:40:51 +0200
Message-ID: <87sgytvgdo.fsf@kamboji.qca.qualcomm.com>
References: <20181130120555.1d35eb6b@canb.auug.org.au>
        <20181219134738.4efed34f@canb.auug.org.au>
        <871s6evtra.fsf@kamboji.qca.qualcomm.com>
        <0BA3FCBA62E2DC44AF3030971E174FB3013375F96C@HASMSX112.ger.corp.intel.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <0BA3FCBA62E2DC44AF3030971E174FB3013375F96C@HASMSX112.ger.corp.intel.com>
        (Emmanuel Grumbach's message of "Wed, 19 Dec 2018 08:31:54 +0000")
Sender: linux-kernel-owner@vger.kernel.org
To: "Grumbach, Emmanuel" <emmanuel.grumbach@intel.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Wireless <linux-wireless@vger.kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "Sharon, Sara" <sara.sharon@intel.com>, "Coelho, Luciano" <luciano.coelho@intel.com>, Kees Cook <keescook@google.com>, "Gustavo A. R. Silva" <gustavo@embeddedor.com>, David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

"Grumbach, Emmanuel" <emmanuel.grumbach@intel.com> writes:

>> 
>> Stephen Rothwell <sfr@canb.auug.org.au> writes:
>> 
>> > On Fri, 30 Nov 2018 12:05:55 +1100 Stephen Rothwell
>> <sfr@canb.auug.org.au> wrote:
>> >>
>> >> After merging the wireless-drivers-next tree, today's linux-next
>> >> build
>> >> (x86_64 allmodconfig) produced these warnings:
>> >>
>> >> drivers/net/wireless/intel/iwlwifi/iwl-drv.c: In function
>> 'iwl_parse_tlv_firmware':
>> >> drivers/net/wireless/intel/iwlwifi/iwl-drv.c:1098:7: warning: this
>> statement may fall through [-Wimplicit-fallthrough=]
>> >>     if (iwlwifi_mod_params.enable_ini)
>> >>        ^
>> >> drivers/net/wireless/intel/iwlwifi/iwl-drv.c:1100:3: note: here
>> >>    default:
>> >>    ^~~~~~~
>> >> drivers/net/wireless/intel/iwlwifi/iwl-dbg-tlv.c: In function
>> 'iwl_parse_fw_dbg_tlv':
>> >> drivers/net/wireless/intel/iwlwifi/iwl-dbg-tlv.c:203:4: warning: this
>> statement may fall through [-Wimplicit-fallthrough=]
>> >>     iwl_fw_dbg_copy_tlv(trans, tlv, true);
>> >>     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> >> drivers/net/wireless/intel/iwlwifi/iwl-dbg-tlv.c:204:3: note: here
>> >>    default:
>> >>    ^~~~~~~
>> >>
>> >> Introduced by commit
>> >>
>> >>   f14cda6f3b31 ("iwlwifi: trans: parse and store debug ini TLVs")
>> >>
>> >> These are noted because I use -Wimplict-fallthrough
>> >>
>> >> The warnings can be suppressed by adding a comment like
>> >> 	/* fall through */
>> >> at the appropriate place to indicate that the fallthough is intended.
>> >
>> > I am still seeing these warnings (but in the net-next tree now) and I
>> > do not see a fix patch in the wireless-drivers-next tree.
>> 
>> Luca did submit a patch[1] for cfg80211 to fix those but I don't see any
>> patches for iwlwifi (even in the one pending pull request he sent), not sure
>> what happened. I know that Luca is already on holidays but adding
>> Emmanuel, maybe he can help here?
>> 
>
> Just sent a patch.

I see it thanks:

https://patchwork.kernel.org/patch/10736967/

I'll try to get it to tomorrow's linux-next build.

-- 
Kalle Valo
