From: Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: linux-next: manual merge of the devicetree tree with the
 sound-asoc tree
Date: Wed, 14 Jun 2017 23:52:37 +0300
Message-ID: <c142b783-c2dd-3e9a-344b-b78dcc38867f@linux.intel.com>
References: <20170614125423.48266e23@canb.auug.org.au>
 <CAL_Jsq+h8Bx9Ks8K8f6G7JJcouqChUEX40T4xosBdk+1GJiQiQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga06.intel.com ([134.134.136.31]:3230 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751754AbdFNUwo (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 14 Jun 2017 16:52:44 -0400
In-Reply-To: <CAL_Jsq+h8Bx9Ks8K8f6G7JJcouqChUEX40T4xosBdk+1GJiQiQ@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rob Herring <robherring2@gmail.com>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Mark Brown <broonie@kernel.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Hi Rob,

Rob Herring wrote:
> On Tue, Jun 13, 2017 at 9:54 PM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>> Hi all,
>>
>> Today's linux-next merge of the devicetree tree got a conflict in:
>>
>>   drivers/of/base.c
>>
>> between commits:
>>
>>   4c9c3d595f1b ("of_graph: add of_graph_get_remote_endpoint()")
>>   0ef472a973eb ("of_graph: add of_graph_get_port_parent()")
>>   ac1e6958d3be ("of_graph: add of_graph_get_endpoint_count()")
>>
>> from the sound-asoc tree and commit:
>>
>>   1df09bc66f9b ("of: Move OF property and graph API from base.c to property.c")
>>
>> from the devicetree tree.
>
> Sakari, I forgot about these other changes and the resolution is more
> complex than I want to pass on to Linus. Has the branch I provided
> been pulled in (I guess not since this is the first I've seen of the
> conflict)? We should drop the move for now and do it late in the merge
> window or post -rc1. It can be after your other changes.

Good that this came up now --- I was about to send a pull request to 
Rafael. :-) So no, nothing has been pulled yet that would have included 
the immutable branch you provided.

Regarding the fwnode cleanups through linux-pm on the dt/property-move 
branch --- I'm ok waiting for the next rc1.

After that I'd like to get them in for I have patches for media-tree (of 
which not all are mine) that in turn depend on the fwnode cleanups. 
There still have been surprisingly few conflicts so far.

-- 
Kind regards,

Sakari Ailus
sakari.ailus@linux.intel.com
