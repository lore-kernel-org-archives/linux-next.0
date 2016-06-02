From: David Drysdale <drysdale@google.com>
Subject: Re: linux-next memleak after IO on dax mountpoint
Date: Thu, 2 Jun 2016 16:22:37 +0100
Message-ID: <CAHse=S-H_yMhZKNmMZpb41M+o+2tMRyxiUG9wQoemewBXXYTPw@mail.gmail.com>
References: <20160527084617.GD2933@dhcp12-144.nay.redhat.com> <20160528040554.GA23685@dhcp12-144.nay.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160528040554.GA23685@dhcp12-144.nay.redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Xiong Zhou <xzhou@redhat.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, axboe@fb.com, linux-next@vger.kernel.org, linux-nvdimm@ml01.01.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Sat, May 28, 2016 at 5:05 AM, Xiong Zhou <xzhou@redhat.com> wrote:
> On Fri, May 27, 2016 at 04:46:17PM +0800, Xiong Zhou wrote:
> ...
>> Still working on to id which commit in this merge causes this issuer=
,
>
> Narrowed down to:
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

=46WIW, I'm also seeing kmemleak report a leak with v4.7-rc1, in
a different scenario (just normal desktop use).  Not done much
digging so far, but this commit (9082e87bf) looks like it might be
relevant -- lots of the following:

unreferenced object 0xffff8800c288e900 (size 256):
  comm "dconf-service", pid 1461, jiffies 4294895636 (age 48.028s)
  hex dump (first 32 bytes):
    00 00 00 00 00 00 00 00 c0 a4 c0 c6 00 88 ff ff  ................
    02 20 00 20 00 00 00 00 11 00 00 00 00 00 00 00  . . ............
  backtrace:
    [<ffffffff81955228>] kmemleak_alloc+0x28/0x50
    [<ffffffff81268bdc>] kmem_cache_alloc+0xfc/0x360
    [<ffffffff81203275>] mempool_alloc_slab+0x15/0x20
    [<ffffffff812030de>] mempool_alloc+0x6e/0x170
    [<ffffffff815014e8>] bio_alloc_bioset+0xb8/0x230
    [<ffffffff81514174>] next_bio+0x24/0x50
    [<ffffffff815145ef>] blkdev_issue_zeroout+0xdf/0x1d0
    [<ffffffff8132ce79>] ext4_issue_zeroout+0x39/0x50
    [<ffffffff81357abf>] ext4_ext_zeroout+0x2f/0x40
    [<ffffffff8135ece0>] ext4_ext_map_blocks+0x1870/0x2190
    [<ffffffff8132cfa1>] ext4_map_blocks+0x111/0x620
    [<ffffffff81330dc8>] ext4_writepages+0x7c8/0x10a0
    [<ffffffff81211851>] do_writepages+0x21/0x30
    [<ffffffff812012ba>] __filemap_fdatawrite_range+0xaa/0xf0
    [<ffffffff812013fd>] filemap_write_and_wait_range+0x2d/0x70
    [<ffffffff81326f6d>] ext4_sync_file+0x18d/0x500


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
> These commits can not be reverted cleanly.
