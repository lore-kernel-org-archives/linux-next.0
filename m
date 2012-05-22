From: Mauro Carvalho Chehab <mchehab@redhat.com>
Subject: Re: linux-next: manual merge of the edac tree with the trivial tree
Date: Tue, 22 May 2012 07:29:45 -0300
Message-ID: <4FBB6A99.4040503@redhat.com>
References: <20120518160603.0eddece830f829d3b8570ac7@canb.auug.org.au> <alpine.LNX.2.00.1205221055340.16396@pobox.suse.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.2.00.1205221055340.16396@pobox.suse.cz>
Sender: linux-kernel-owner@vger.kernel.org
To: Jiri Kosina <jkosina@suse.cz>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, David Mackey <tdmackey@twitter.com>, Vinson Lee <vlee@twitter.com>
List-Id: linux-next.vger.kernel.org

Em 22-05-2012 05:55, Jiri Kosina escreveu:
> On Fri, 18 May 2012, Stephen Rothwell wrote:
> 
>> Hi Mauro,
>>
>> Today's linux-next merge of the edac tree got a conflict in
>> drivers/edac/edac_core.h between commit 15ed103a9800 ("edac: Fix spelling
>> errors") from the trivial tree and commit 90b40d5cadba ("edac: Remove the
>> legacy EDAC ABI") from the edac tree.
>>
>> One of the comments fixed by the former is removed by the latter, so I
>> did that.
> 
> On Fri, 18 May 2012, Stephen Rothwell wrote:
> 
>> Hi Mauro,
>>
>> Today's linux-next merge of the edac tree got a conflict in
>> drivers/edac/edac_device.c between commit 15ed103a9800 ("edac: Fix
>> spelling errors") from the trivial tree and commit b9e889c84229 ("edac:
>> rewrite edac_align_ptr()") from the edac tree.
>>
>> One of the comments fixed by the former is removed by the latter, so I
>> did that.
> 
> I have dropped both hunks, so the conflict should be gone. Thanks.

Thanks!
Mauro
