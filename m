From: David Howells <dhowells@redhat.com>
Subject: Re: linux-next: build failure after merge of the security tree
Date: Wed, 26 Aug 2015 15:45:05 +0100
Message-ID: <15177.1440600305@warthog.procyon.org.uk>
References: <20150817160458.0c2bb25a@canb.auug.org.au> <20150817152953.355a9d4f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150817160458.0c2bb25a@canb.auug.org.au>
Content-ID: <15176.1440600305.1@warthog.procyon.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: dhowells@redhat.com, James Morris <jmorris@namei.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, David Woodhouse <David.Woodhouse@intel.com>
List-Id: linux-next.vger.kernel.org

Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> > After a bit of digging, I installed libssl-dev on my Debian build
> > machines.
> 
> Is this worth a mention in Documentation/Changes along with all the
> other prerequisites?

Could be.  It's mentioned in the Kconfig and Documentation/module-signing.txt
already, but this looks like a good place.

David
