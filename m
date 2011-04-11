From: "Justin P. Mattock" <justinmattock@gmail.com>
Subject: Re: linux-next: manual merge of the trivial tree with the wireless
 tree
Date: Mon, 11 Apr 2011 08:24:24 -0700
Message-ID: <4DA31D28.20906@gmail.com>
References: <20110411132844.fa651c08.sfr@canb.auug.org.au> <4DA31B20.1010205@gmail.com> <alpine.LNX.2.00.1104111716590.12035@pobox.suse.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.2.00.1104111716590.12035@pobox.suse.cz>
Sender: linux-kernel-owner@vger.kernel.org
To: Jiri Kosina <jkosina@suse.cz>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Felix Fietkau <nbd@openwrt.org>, "John W. Linville" <linville@tuxdriver.com>
List-Id: linux-next.vger.kernel.org

On 04/11/2011 08:17 AM, Jiri Kosina wrote:
> On Mon, 11 Apr 2011, Justin P. Mattock wrote:
>
>>> Today's linux-next merge of the trivial tree got a conflict in
>>> drivers/net/wireless/ath/ath9k/phy.h between commit a9b6b2569cf1
>>> ("ath9k_hw: turn a few big macros into functions") from the wireless tree
>>> and commit 6eab04a87677 ("treewide: remove extra semicolons") from the
>>> trivial tree.
>>>
>>> The former commit removed the code that the latter changed, so I did that.
>>
>> yikes... I dont like seeing that.. what can I do to help with this?
>
> No need for you to do anything. I'll resolve the conflict.
>

o.k.!

Justin P. Mattock
