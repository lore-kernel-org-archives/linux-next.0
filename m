From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: linux-next: manual merge of the kvm-ppc tree with the kvm tree
Date: Tue, 05 Aug 2014 13:39:39 +0200
Message-ID: <53E0C27B.1020503@redhat.com>
References: <20140804180403.3cfdbadf@canb.auug.org.au>	<53E0AB44.90804@imgtec.com> <20140805201342.6b8a8ca4@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20140805201342.6b8a8ca4@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, James Hogan <james.hogan@imgtec.com>
Cc: Alexander Graf <agraf@suse.de>, Marcelo Tosatti <mtosatti@redhat.com>, Gleb Natapov <gleb@kernel.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Alexey Kardashevskiy <aik@ozlabs.ru>
List-Id: linux-next.vger.kernel.org

Il 05/08/2014 12:13, Stephen Rothwell ha scritto:
>> > And I suppose it'd be nice to replace tabs with spaces for consistency
>> > (since that's one of the things bf5590f37919 did).
>> > 
>> > How about this fixup patch?
> Thanks for that I have applied it to my merge resolution.

I've now merged kvm-ppc and kvm-arm into kvm, so everything should be
fixed tomorrow.  All conficts should be gone, and the build failure on
PPC too.

Thanks for your work on linux-next, Stephen.

Paolo
