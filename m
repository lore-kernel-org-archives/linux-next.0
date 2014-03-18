From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [BUG -next] "mm: per-thread vma caching fix 5" breaks s390
Date: Tue, 18 Mar 2014 16:10:50 -0700
Message-ID: <20140318161050.ab184d30edf4b2446a2060de@linux-foundation.org>
References: <20140318124107.GA24890@osiris>
	<CA+8MBbKaaYXNV_XZNRp=wn-+3Mqd4+JVoXn_d+eo=PQR17i1SQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <owner-linux-mm@kvack.org>
In-Reply-To: <CA+8MBbKaaYXNV_XZNRp=wn-+3Mqd4+JVoXn_d+eo=PQR17i1SQ@mail.gmail.com>
Sender: owner-linux-mm@kvack.org
To: Tony Luck <tony.luck@gmail.com>
Cc: Heiko Carstens <heiko.carstens@de.ibm.com>, Davidlohr Bueso <davidlohr@hp.com>, Michel Lespinasse <walken@google.com>, Sasha Levin <sasha.levin@oracle.com>, Rik van Riel <riel@redhat.com>, Linus Torvalds <torvalds@linux-foundation.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, Martin Schwidefsky <schwidefsky@de.ibm.com>
List-Id: linux-next.vger.kernel.org

On Tue, 18 Mar 2014 16:06:59 -0700 Tony Luck <tony.luck@gmail.com> wrote:

> On Tue, Mar 18, 2014 at 5:41 AM, Heiko Carstens
> <heiko.carstens@de.ibm.com> wrote:
> > Given that this is just an addon patch to Davidlohr's "mm: per-thread
> > vma caching" patch I was wondering if something in there is architecture
> > specific.
> > But it doesn't look like that. So I'm wondering if this only breaks on
> > s390?
> 
> I'm seeing this same BUG_ON() on ia64 (when trying out next-20140318)

-next is missing
http://ozlabs.org/~akpm/mmots/broken-out/mm-per-thread-vma-caching-fix-6.patch.
Am presently trying to cook up an mmotm for tomorrow's -next.  

--
To unsubscribe, send a message with 'unsubscribe linux-mm' in
the body to majordomo@kvack.org.  For more info on Linux MM,
see: http://www.linux-mm.org/ .
Don't email: <a href=mailto:"dont@kvack.org"> email@kvack.org </a>
