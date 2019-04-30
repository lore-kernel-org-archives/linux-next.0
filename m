From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Subject: Re: linux-next: build failure after merge of the tpmdd tree
Date: Tue, 30 Apr 2019 17:47:27 +0300
Message-ID: <20190430144727.GA7901@linux.intel.com>
References: <20190416130740.7ff9e561@canb.auug.org.au>
 <20190416153608.GA11353@linux.intel.com>
 <CACdnJuvat4=kXD6NMnMw5E8M4KB_1nBP6Simi8gBUChdBs7eRw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CACdnJuvat4=kXD6NMnMw5E8M4KB_1nBP6Simi8gBUChdBs7eRw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthew Garrett <mjg59@google.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, jmorris@namei.org
List-Id: linux-next.vger.kernel.org

On Thu, Apr 18, 2019 at 12:40:48PM -0700, Matthew Garrett wrote:
> On Tue, Apr 16, 2019 at 8:36 AM Jarkko Sakkinen
> <jarkko.sakkinen@linux.intel.com> wrote:
> > Matthew, looking at the code I guess the includes are in wrong order
> > i.e. early_ioremap.h should be included before tpm_eventlog.h. Do you
> > agree that this is the correct conclusion? I can do the update.
> 
> Yes, I believe that that's the correct fix.

I'll hold  up until the previous flush of patches is in
security/next-general (bug fixes for v5.1 changes).

/Jarkko
