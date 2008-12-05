From: Nick Andrew <nick@nick-andrew.net>
Subject: Re: linux-next: trivial tree
Date: Fri, 5 Dec 2008 12:04:21 +1100
Message-ID: <20081205010421.GA31220@mail.local.tull.net>
References: <alpine.LNX.1.10.0811271145180.19853@jikos.suse.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1756245AbYLEBEh@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <alpine.LNX.1.10.0811271145180.19853@jikos.suse.cz>
Sender: linux-kernel-owner@vger.kernel.org
To: Jiri Kosina <jkosina@suse.cz>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, Jesper Juhl <jesper.juhl@gmail.com>, Joe Perches <joe@perches.com>
List-Id: linux-next.vger.kernel.org

On Thu, Nov 27, 2008 at 11:49:59AM +0100, Jiri Kosina wrote:
> I have taken over trivial patches maintainership from Jesper.

FYI, you might (still) have a patch in your tree from me called
'Tighten Use of Loose' which fixes spelling errors in a number of
files across the repository. It's been a few months and I noticed it's
not yet in Linus' repository, presumably due to it conflicting with
functional changes done in the subsystems. So I've split it into
one-patch-per-file now and I'll submit to the subsystem maintainers
individually, with the help of Joe Perches' annotated MAINTAINERS
file and email lookup script.

Nick.
