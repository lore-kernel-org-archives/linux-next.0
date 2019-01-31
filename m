From: Kalle Valo <kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: linux-next: build warning after merge of the wireless-drivers-next tree
Date: Thu, 31 Jan 2019 15:46:03 +0200
Message-ID: <875zu5j5yc.fsf@kamboji.qca.qualcomm.com>
References: <20190131104626.62ff05ce@canb.auug.org.au>
        <9455f1b9e746f2c28d1573ccdce3836ece42cd8a.camel@coelho.fi>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <9455f1b9e746f2c28d1573ccdce3836ece42cd8a.camel-XPOmlcxoEMv1KXRcyAk9cg@public.gmane.org> (Luca
        Coelho's message of "Thu, 31 Jan 2019 01:51:44 +0200")
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Luca Coelho <luca-XPOmlcxoEMv1KXRcyAk9cg@public.gmane.org>
Cc: Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>, Wireless <linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Next Mailing List <linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Johannes Berg <johannes.berg-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
List-Id: linux-next.vger.kernel.org

Luca Coelho <luca-XPOmlcxoEMv1KXRcyAk9cg@public.gmane.org> writes:

> On Thu, 2019-01-31 at 10:46 +1100, Stephen Rothwell wrote:
>> Hi all,
>> 
>> After merging the wireless-drivers-next tree, today's linux-next
>> build
>> (x86_64 allmodconfig) produced this warning:
>> 
>> drivers/net/wireless/intel/iwlwifi/mvm/rxmq.c:195:13: warning:
>> 'iwl_mvm_add_rtap_sniffer_config' defined but not used [-Wunused-
>> function]
>>  static void iwl_mvm_add_rtap_sniffer_config(struct iwl_mvm *mvm,
>>              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> 
>> Introduced by commit
>> 
>>   9bf13bee2d74 ("iwlwifi: mvm: include configured sniffer AID in
>> radiotap")
>
> This was a conflict resolution damage in one of the patches I applied. 
> We already have a fix for it[1] and Kalle will apply it to wireless-
> drivers-next soon.
>
> Sorry for the trouble, but somehow I didn't see this warning and
> kbuildbot also reported successful compilation with it. :(
>
> [1] https://patchwork.kernel.org/patch/10788503/

I applied the fix now:

https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/wireless-drivers-next.git/commit/?id=3864be551405b582ae38fbcdfdbb6e49052f5f6d

-- 
Kalle Valo
