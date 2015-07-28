From: Ralf Baechle <ralf@linux-mips.org>
Subject: Re: Crash in -next due to 'MIPS: Move FP usage checks into
 protected_{save, restore}_fp_context'
Date: Tue, 28 Jul 2015 10:31:13 +0200
Message-ID: <20150728083113.GD30938@linux-mips.org>
References: <20150715160918.GA27653@roeck-us.net>
 <20150727150652.GA1756@roeck-us.net>
 <20150727172142.GE7289@NP-P-BURTON>
 <20150727174622.GA10708@roeck-us.net>
 <20150727180442.GG7289@NP-P-BURTON>
 <20150727194401.GC14674@roeck-us.net>
 <20150727200214.GH7289@NP-P-BURTON>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-mips-bounce@linux-mips.org>
Content-Disposition: inline
In-Reply-To: <20150727200214.GH7289@NP-P-BURTON>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Paul Burton <paul.burton@imgtec.com>
Cc: Guenter Roeck <linux@roeck-us.net>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mips@linux-mips.org
List-Id: linux-next.vger.kernel.org

On Mon, Jul 27, 2015 at 01:02:14PM -0700, Paul Burton wrote:

> Ralf: can you update the patches in -next please?

Done.  Will push in a few minutes to upstream-sfr; should make it to
-next by tomorrow.

But <rant> could you next time please send a patchset based on something
halfway recent?  Five patches had merge conflicts, one is already upstream.
</rant>.

  Ralf
