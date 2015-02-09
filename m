From: Jiang Liu <jiang.liu@linux.intel.com>
Subject: Re: linux-next: build failure after merge of the pm tree
Date: Mon, 09 Feb 2015 23:21:25 +0800
Message-ID: <54D8D075.3030301@linux.intel.com>
References: <20150209132642.0d61b6ed@canb.auug.org.au> <54D84747.10501@linux.intel.com> <20150209062340.GA10051@e102568-lin.cambridge.arm.com> <2023771.7SV6akbkpr@vostro.rjw.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <2023771.7SV6akbkpr@vostro.rjw.lan>
Sender: linux-kernel-owner@vger.kernel.org
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Bjorn Helgaas <bhelgaas@google.com>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On 2015/2/9 23:10, Rafael J. Wysocki wrote:
> On Monday, February 09, 2015 06:23:40 AM Lorenzo Pieralisi wrote:
>> On Mon, Feb 09, 2015 at 05:36:07AM +0000, Jiang Liu wrote:
>>> Hi Rafael and Lorenzo,
>>> 	With more closer review, I suspect statement "kfree(bus_range)"
>>> in commit d2be00c0fb5a ("of/pci: Free resources on failure in
>>> of_pci_get_host_bridge_resources()") may cause double free of bus_range
>>> because bus_range will also be freed by kfree(window->res);
>>
>> Gah, my bad, you are right, sorry I missed that. Please let me know
>> how you prefer fixing that, you could remove that line as part
>> of the merge commit, or I can send you a patch to apply on top of it,
>> it is a trivial one-line removal.
> 
> I re-did the merge.
> 
> Please have a look at my linux-next branch again and let me know if that's OK
> with everybody.
I'm OK with new merging commit.
