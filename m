From: Matthew Garrett <mjg59@google.com>
Subject: Re: linux-next: build failure after merge of the tpmdd tree
Date: Thu, 18 Apr 2019 12:40:48 -0700
Message-ID: <CACdnJuvat4=kXD6NMnMw5E8M4KB_1nBP6Simi8gBUChdBs7eRw@mail.gmail.com>
References: <20190416130740.7ff9e561@canb.auug.org.au> <20190416153608.GA11353@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190416153608.GA11353@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Tue, Apr 16, 2019 at 8:36 AM Jarkko Sakkinen
<jarkko.sakkinen@linux.intel.com> wrote:
> Matthew, looking at the code I guess the includes are in wrong order
> i.e. early_ioremap.h should be included before tpm_eventlog.h. Do you
> agree that this is the correct conclusion? I can do the update.

Yes, I believe that that's the correct fix.
