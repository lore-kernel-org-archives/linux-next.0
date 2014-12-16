From: Al Viro <viro@ZenIV.linux.org.uk>
Subject: Re: [BUG, linux-next] spawn PID 1 without CLONE_FS, wireless inop
Date: Tue, 16 Dec 2014 12:56:15 +0000
Message-ID: <20141216125615.GZ22149@ZenIV.linux.org.uk>
References: <20141216115537.GA1259@hudson.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20141216115537.GA1259@hudson.localdomain>
Sender: linux-kernel-owner@vger.kernel.org
To: Jeremiah Mahler <jmmahler@gmail.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, linux-fsdevel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Tue, Dec 16, 2014 at 03:55:37AM -0800, Jeremiah Mahler wrote:
> all,
> 
> The wireless network interface has become inoperative when running
> linux-next 20141216 on a Lenovo Carbon X1.  It is completely
> non-existent and `ip addr` doesn't show it.  A bisect has found that
> the bug was introduced by the following commit.

Very interesting.  What userland are you running?  I take it, the root
filesystem is mounted and system boot except for that interface not
coming up, right?

Your card is normally handled by what, iwlwifi?  What happens upon
modprobe iwlwifi (or whatever module you see loaded on the normal
boot)?  Another interesting question is whether it manages to load
the firmware...  What happens if you boot with debug in kernel command
line, with working and with non-working kernels resp.?
