From: "Theodore Y. Ts'o" <tytso@mit.edu>
Subject: Re: linux-next: build warnings from Linus' tree
Date: Sun, 19 Aug 2018 22:53:56 -0400
Message-ID: <20180820025356.GF19200@thunk.org>
References: <20180820081323.23a47af3@canb.auug.org.au>
 <CA+55aFw4WcLcFJkoWoE2v--J3s2Hk8JBU92=Zh351FH7xY8zpw@mail.gmail.com>
 <20180820013319.slygmbleia55evtl@angband.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180820013319.slygmbleia55evtl@angband.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: Adam Borowski <kilobyte@angband.pl>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Mon, Aug 20, 2018 at 03:33:19AM +0200, Adam Borowski wrote:
> Valid uses of strncpy() do exist (such as SCSI structs), but those deal with
> fixed-width fields.  Thus, gcc is right for warning for at least some of
> misuse of strncpy() for C strings.  The function wasn't designed for them.

The problem is that the kernel has a goodly share of fixed-width
fields.  The ext4 superblock is one of them.  strncpy() is the most
convenient function to do what is needed.  If it's a valid use, then
we need to have a way to get gcc to shut up about them.

	   	   	      	 - Ted
