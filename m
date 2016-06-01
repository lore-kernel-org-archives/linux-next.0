From: Jeff Moyer <jmoyer@redhat.com>
Subject: Re: linux-next memleak after IO on dax mountpoint
Date: Wed, 01 Jun 2016 10:37:26 -0400
Message-ID: <x49shwxvuu1.fsf@segfault.boston.devel.redhat.com>
References: <20160527084617.GD2933@dhcp12-144.nay.redhat.com>
	<20160528040554.GA23685@dhcp12-144.nay.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:49653 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754896AbcFAOh3 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 1 Jun 2016 10:37:29 -0400
In-Reply-To: <20160528040554.GA23685@dhcp12-144.nay.redhat.com> (Xiong Zhou's
	message of "Sat, 28 May 2016 12:05:54 +0800")
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Xiong Zhou <xzhou@redhat.com>
Cc: sfr@canb.auug.org.au, axboe@fb.com, linux-next@vger.kernel.org, linux-nvdimm@ml01.01.org, linux-kernel@vger.kernel.org

Xiong Zhou <xzhou@redhat.com> writes:

> On Fri, May 27, 2016 at 04:46:17PM +0800, Xiong Zhou wrote:
> ...
>> Still working on to id which commit in this merge causes this issuer=
,
>
> Narrowed down to:

Hi Xiong,

I don't see how any of those could be at all relevant to pmem.  Can you
post the output from 'cat /proc/slabinfo' here?

Thanks,
Jeff

>
> 37e5823 block: add offset in blk_add_request_payload()
> e048948 blk-mq: Export tagset iter function
> 58b4560 nvme: add helper nvme_map_len()
> 03b5929 nvme: rewrite discard support
> 8093f7c nvme: add helper nvme_setup_cmd()
> 21f033f NVMe: Skip async events for degraded controllers
> 82b4552 nvme: Use blk-mq helper for IO termination
> 93e9d8e block: add ability to flag write back caching on a device
> 519a7e1 dm: switch to using blk_queue_write_cache()
> bb8d261 nvme: introduce a controller state machine
> 92911a5 nvme: tighten up state check for namespace scanning
> 5955be2 nvme: move namespace scanning to core
> f866fc4 nvme: move AER handling to common code
> 0bf77e9 nvme: switch to RCU freeing the namespace
> 9082e87 block: remove struct bio_batch
> 38f2525 block: add __blkdev_issue_discard
> 57aac2f lightnvm: fix "warning: =E2=80=98ret=E2=80=99 may be used uni=
nitialized"
> ecfb40c lightnvm: handle submit_io failure
> 1145e63 lightnvm: implement nvm_submit_ppa_list
> 22e8c97 lightnvm: move block fold outside of get_bb_tbl()
> 7f7c5d0 lightnvm: avoid memory leak when lun_map kcalloc fails
> 5136061 lightnvm: introduce nvm_for_each_lun_ppa() macro
> e11903f lightnvm: refactor device ops->get_bb_tbl()
> 5ebc7d9 lightnvm: make nvm_set_rqd_ppalist() aware of vblks
> a63d5cf lightnvm: move responsibility for bad blk mgmt to target
> 00ee6cc lightnvm: refactor set_bb_tbl for accepting ppa list
> 003fad3 lightnvm: enable metadata to be sent to device
> 04a8aa1 lightnvm: expose gennvm_mark_blk to targets
>
>
> These commits can not be reverted cleanly.=20
