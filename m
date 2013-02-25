From: Sedat Dilek <sedat.dilek@gmail.com>
Subject: Re: linux-next: Tree for Feb 23 [ fs/dcache.c: Root dentry has weird
 name <SYSV00000000> ]
Date: Mon, 25 Feb 2013 15:35:54 +0100
Message-ID: <CA+icZUWh09aGsD25Xhx+WNWo65U7Wn6ydLZy1vep3hzecy5RyQ@mail.gmail.com>
References: <CA+icZUVE-KzZ_ZnhjK+WzaC9KWuwuOK0TAJbNcn+Vn=HC=snhQ@mail.gmail.com>
	<20130225135436.GA4503@ZenIV.linux.org.uk>
	<CA+icZUXLO6MX==1zz1CUL+ytXv1bt+HjDx8Gug2p7GmfqtYBHw@mail.gmail.com>
	<20130225142749.GB4503@ZenIV.linux.org.uk>
Reply-To: sedat.dilek@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20130225142749.GB4503@ZenIV.linux.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, linux-fsdevel <linux-fsdevel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Mon, Feb 25, 2013 at 3:27 PM, Al Viro <viro@zeniv.linux.org.uk> wrote:
> On Mon, Feb 25, 2013 at 03:22:03PM +0100, Sedat Dilek wrote:
>> On Mon, Feb 25, 2013 at 2:54 PM, Al Viro <viro@zeniv.linux.org.uk> wrote:
>> > On Mon, Feb 25, 2013 at 02:22:42PM +0100, Sedat Dilek wrote:
>> >
>> >> [  120.310366] Root dentry has weird name <SYSV00000000>
>> >
>> > Umm...  Almost certainly a result of switching to shmem_file_setup() to
>> > d_alloc_pseudo(); I'll fix it (give the suckers ->d_op of their own).
>> > For now, just ignore the warning - it's harmless.  Or revert commit
>> > 7dbc68fcb0cdce27737dba9ee252f26d39d75fb6 and see if the rest of your
>> > problems persist; I would be very surprised if anything other than this
>> > warning had been caused by that commit.
>>
>> Thanks for the quick fix!
>>
>> YES, with "Revert "shmem_setup_file(): use d_alloc_pseudo() instead of
>> d_alloc()"" I do NOT see these warnings anymore.
>
> Umm...  Are the perf ones you are seeing eliminated by that as well?  I would
> expect them to be an independent problem...

Independent as I still see them.
Please, see also my report in "Re: linux-next: Tree for Feb 23 [ perf:
NULL pointer dereference perf_init_event() ]" [1].

- Sedat -

[1] https://lkml.org/lkml/2013/2/25/119
