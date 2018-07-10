From: Jens Axboe <axboe@kernel.dk>
Subject: Re: linux-next: build warning after merge of the scsi tree
Date: Tue, 10 Jul 2018 08:09:57 -0600
Message-ID: <280ebbdf-fafb-1744-f517-815a30e682bb@kernel.dk>
References: <20180620132911.5f6ab464@canb.auug.org.au>
 <20180710173114.17ee69ad@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180710173114.17ee69ad@canb.auug.org.au>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, James Bottomley <James.Bottomley@HansenPartnership.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Matthew Wilcox <willy@infradead.org>, "Martin K. Petersen" <martin.petersen@oracle.com>, Felipe Balbi <felipe.balbi@linux.intel.com>, Omar Sandoval <osandov@fb.com>
List-Id: linux-next.vger.kernel.org

On 7/10/18 1:31 AM, Stephen Rothwell wrote:
> Hi all,
> 
> On Wed, 20 Jun 2018 13:29:10 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>>
>> After merging the scsi tree, today's linux-next build (powerpc
>> allyesconfig) produced this warning:
>>
>> In file included from include/target/target_core_base.h:7:0,
>>                  from drivers/target/target_core_tmr.c:31:
>> include/linux/sbitmap.h:331:46: warning: 'struct seq_file' declared inside parameter list will not be visible outside of this definition or declaration
>>  void sbitmap_show(struct sbitmap *sb, struct seq_file *m);
>>                                               ^~~~~~~~
>> include/linux/sbitmap.h:342:53: warning: 'struct seq_file' declared inside parameter list will not be visible outside of this definition or declaration
>>  void sbitmap_bitmap_show(struct sbitmap *sb, struct seq_file *m);
>>                                                      ^~~~~~~~
>> include/linux/sbitmap.h:530:59: warning: 'struct seq_file' declared inside parameter list will not be visible outside of this definition or declaration
>>  void sbitmap_queue_show(struct sbitmap_queue *sbq, struct seq_file *m);
>>                                                            ^~~~~~~~
>> In file included from include/target/target_core_base.h:7:0,
>>                  from drivers/target/target_core_ua.c:30:
>> include/linux/sbitmap.h:331:46: warning: 'struct seq_file' declared inside parameter list will not be visible outside of this definition or declaration
>>  void sbitmap_show(struct sbitmap *sb, struct seq_file *m);
>>                                               ^~~~~~~~
>> include/linux/sbitmap.h:342:53: warning: 'struct seq_file' declared inside parameter list will not be visible outside of this definition or declaration
>>  void sbitmap_bitmap_show(struct sbitmap *sb, struct seq_file *m);
>>                                                      ^~~~~~~~
>> include/linux/sbitmap.h:530:59: warning: 'struct seq_file' declared inside parameter list will not be visible outside of this definition or declaration
>>  void sbitmap_queue_show(struct sbitmap_queue *sbq, struct seq_file *m);
>>                                                            ^~~~~~~~
>>
>> Introduced by commit
>>
>>   24af1ccfe12a ("sbitmap: add helpers for dumping to a seq_file")
>>
>> in v4.11.rc1, but exposed by commit
>>
>>   eca7ee1f33e8 ("scsi: target: Convert target drivers to use sbitmap")
> 
> I am still seeing these warnings ...

Martin queued up the forward declaration patch for this one, not sure
why it isn't showing up in the scsi tree yet.

-- 
Jens Axboe
