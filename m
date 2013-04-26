From: Sedat Dilek <sedat.dilek@gmail.com>
Subject: Re: mmotm 2013-04-25-16-24 uploaded
Date: Fri, 26 Apr 2013 14:05:52 +0200
Message-ID: <CA+icZUXqmF5QcfVtGpEh5KX4OkgbUncyZB0DKixqSNquUpis1A@mail.gmail.com>
References: <20130425232702.AF3D831C265@corp2gmr1-1.hot.corp.google.com>
Reply-To: sedat.dilek@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <owner-linux-mm@kvack.org>
In-Reply-To: <20130425232702.AF3D831C265@corp2gmr1-1.hot.corp.google.com>
Sender: owner-linux-mm@kvack.org
To: akpm@linux-foundation.org
Cc: mm-commits@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-fsdevel@vger.kernel.org, linux-next@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Fri, Apr 26, 2013 at 1:27 AM,  <akpm@linux-foundation.org> wrote:
> The mm-of-the-moment snapshot 2013-04-25-16-24 has been uploaded to
>
>    http://www.ozlabs.org/~akpm/mmotm/
>

Hi Andrew,

Nice to see that IPC-SEM is now safe again with Linux-Next (next-20130426).

Affected patches...

ipcsem-fine-grained-locking-for-semtimedop-do-not-call-sem_lock-when-bogus-sma.patch
ipcsem-fine-grained-locking-for-semtimedop-fix-lockdep-false-positive.patch
ipcsem-fine-grained-locking-for-semtimedop-fix-locking-in-semctl_main.patch
ipcsem-fine-grained-locking-for-semtimedop-ipc-make-refcounter-atomic-fix.patch
ipcsem-fine-grained-locking-for-semtimedop-ipc-make-refcounter-atomic.patch
ipcsem-fine-grained-locking-for-semtimedop-untangle-rcu-locking-with-find_alloc_undo.patch

Just see one patch has my Tested-by (Reported-by) ...

All these 6 ipc-sem-next patches were tested several times by me.

It took me approx 2 weeks and XX kernel-builds.
Please gimme appropriate credits, Thanks.

Have a nice weekend,
- Sedat -

P.S.: Check for Sedat's credits.

ipcsem-fine-grained-locking-for-semtimedop-fix-lockdep-false-positive.patch:Cc:
Sedat Dilek <sedat.dilek@gmail.com>

ipcsem-fine-grained-locking-for-semtimedop-ipc-make-refcounter-atomic.patch:Sedat
reported an issue leading to a NULL dereference in update_queue():
ipcsem-fine-grained-locking-for-semtimedop-ipc-make-refcounter-atomic.patch:Tested-by:
Sedat Dilek <sedat.dilek@gmail.com>

ipcsem-fine-grained-locking-for-semtimedop-ipc-make-refcounter-atomic.patch:Reported-by:
Sedat Dilek <sedat.dilek@gmail.com>

ipcsem-fine-grained-locking-for-semtimedop-ipc-make-refcounter-atomic.patch:Cc:
Sedat Dilek <sedat.dilek@gmail.com>

--
To unsubscribe, send a message with 'unsubscribe linux-mm' in
the body to majordomo@kvack.org.  For more info on Linux MM,
see: http://www.linux-mm.org/ .
Don't email: <a href=mailto:"dont@kvack.org"> email@kvack.org </a>
