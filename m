From: Avi Kivity <avi@redhat.com>
Subject: Re: linux-next: add utrace tree
Date: Mon, 08 Feb 2010 12:09:36 +0200
Message-ID: <4B6FE2E0.6080803@redhat.com>
References: <alpine.LFD.2.00.1001221614520.13231@localhost.localdomain>
	<f73f7ab81001222220jfaf2edfwca3fa4c22b0b4d72@mail.gmail.com>
	<alpine.LFD.2.00.1001232051510.3574@localhost.localdomain>
	<m33a1tnbd9.fsf@fleche.redhat.com>
	<alpine.LFD.2.00.1001251332370.3574@localhost.localdomain>
	<m3636oh2rt.fsf@fleche.redhat.com>
	<alpine.LFD.2.00.1001261535510.17519@localhost.localdomain>
	<1264575134.4283.1983.camel@laptop>
	<alpine.LFD.2.00.1001270231520.24253@localhost.localdomain>
	<1264589716.4283.2006.camel@laptop>
	<20100127110555.GB1842@in.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <utrace-devel-bounces@redhat.com>
In-Reply-To: <20100127110555.GB1842@in.ibm.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/utrace-devel>,
	<mailto:utrace-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/utrace-devel>
List-Post: <mailto:utrace-devel@redhat.com>
List-Help: <mailto:utrace-devel-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/utrace-devel>,
	<mailto:utrace-devel-request@redhat.com?subject=subscribe>
Sender: utrace-devel-bounces@redhat.com
Errors-To: utrace-devel-bounces@redhat.com
To: ananth@in.ibm.com
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Kyle Moffett <kyle@moffetthome.net>, Peter Zijlstra <peterz@infradead.org>, Fr??d??ric Weisbecker <fweisbec@gmail.com>, Tom Tromey <tromey@redhat.com>, Oleg Nesterov <oleg@redhat.com>, Steven Rostedt <rostedt@goodmis.org>, LKML <linux-kernel@vger.kernel.org>, Arnaldo Carvalho de Melo <acme@redhat.com>, "Frank Ch. Eigler" <fche@redhat.com>, linux-next@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>, utrace-devel@redhat.com, Thomas Gleixner <tglx@linutronix.de>, Linus Torvalds <torvalds@linux-foundation.org>
List-Id: linux-next.vger.kernel.org

On 01/27/2010 01:05 PM, Ananth N Mavinakayanahalli wrote:
> We don't need to write one. I don't know how easy it is to make the kvm
> emulator less kvm-centric (vcpus, kvm_context, etc). Avi?
>    

It's a lot of mindless work but not too difficult; replacing hardcoded 
accessors with function pointers.

-- 
error compiling committee.c: too many arguments to function
